% function for SSR and MSR
function [output1,output2] = func_Retinex(input)
image = input;

% figure
% subplot(1,3,1);
% imshow(image);
% title('Original');

output1 = SSR(image);
% subplot(1,3,2);
% imshow(output1);
% title('SSR');

output2 = MSR(image);
% subplot(1,3,3);
% imshow(output2);
% title('MSR');