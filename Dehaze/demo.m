%% Initialization
clc
clear
close all
warning ('off','all');
addpath('./functions/');
addpath('./functions4DCP/');
addpath('./functions4Retinex/');
addpath('./NR/');
addpath('./R/');

%% Load image
image_mode = input('Please choose the image set, 1 for real-world images, 2 for synthetic images: ');
% You should set your own file path below.
if image_mode == 1    
    [File_Name,Path] = uigetfile(fullfile('D:\Academic\Design\Dehaze\test_images\real-world\','*.tif;*.jpg;*.png;*.gif*'),'Image Selector');
elseif image_mode == 2
    [File_Name,Path] = uigetfile(fullfile('D:\Academic\Design\Dehaze\test_images\synthetic\synthetic\','*.tif;*.jpg;*.png;*.gif*'),'Image Selector');
else
    error('This image set does not exist.');
end

image = double(imread(fullfile(Path, File_Name)))./255;

%% Haze removal using Dark Channel Prior and Retinex
output0 = func_DCP_noSkyDetect(image); % Dark Channel Prior
output1 = func_DCP(image); % Dark Channel Prior with sky detect
[output2,output3] = func_Retinex(image); % Single Scale Retinex (SSR) and Multi-Scale Retinex (MSR)
output4 = func_MSRCR(image,output3); % Multi-Scale Retinex with Color Restore (MSRCR)
output4 = real(output4); % For unknown reasons, MSRCR may produce unnecessary imaginary part.
output4 = double(output4)./255;

close all
figure('NumberTitle','off','Name','Comparison')
subplot(3,3,1);imshow(image);title('Hazy image');
subplot(3,3,4);imshow(output0);title('DCP');
subplot(3,3,5);imshow(output1);title('DCP with sky detect');
subplot(3,3,7);imshow(output2);title('SSR');
subplot(3,3,8);imshow(output3);title('MSR');
subplot(3,3,9);imshow(output4);title('MSRCR');

%% No-Reference Assessment
figure('NumberTitle','off','Name','No-Reference Assessment')
quality_assessment_6(image,output0,output1,output2,output3,output4);

%% Assessment with reference images
if image_mode ==2
    fprintf('Please choose the reference image\n');
    % Don't forget to set your own file path below.
    [File_Name2,Path] = uigetfile(fullfile('D:\Academic\Design\Dehaze\test_images\synthetic\original\','*.tif;*.jpg;*.png;*.gif*'),'Image Selector');
    if strcmp(File_Name,File_Name2) == 0 % In case a wrong image is picked.
        error('Wrong reference image!');
    else
        image0 = double(imread(fullfile(Path, File_Name2)))./255;
    end
else
    error('For real-world images, it''s the end of the program.');
end

figure('NumberTitle','off','Name','Assessment with the reference image')
ref_assessment(image0,image,output0,output1,output2,output3,output4);