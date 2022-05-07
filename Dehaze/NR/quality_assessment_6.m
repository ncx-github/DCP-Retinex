function h = quality_assessment_6(image1,image2,image3,image4,image5,image6)
NIQE1 = niqe(image1);
NIQE2 = niqe(image2);
NIQE3 = niqe(image3);
NIQE4 = niqe(image4);
NIQE5 = niqe(image5);
NIQE6 = niqe(image6);

Entropy1 = entropy(image1);
Entropy2 = entropy(image2);
Entropy3 = entropy(image3);
Entropy4 = entropy(image4);
Entropy5 = entropy(image5);
Entropy6 = entropy(image6);

TenenGrad1 = tenengrad(image1);
TenenGrad2 = tenengrad(image2);
TenenGrad3 = tenengrad(image3);
TenenGrad4 = tenengrad(image4);
TenenGrad5 = tenengrad(image5);
TenenGrad6 = tenengrad(image6);

[SMD_1,SMD2_1] = smd(image1);
[SMD_2,SMD2_2] = smd(image2);
[SMD_3,SMD2_3] = smd(image3);
[SMD_4,SMD2_4] = smd(image4);
[SMD_5,SMD2_5] = smd(image5);
[SMD_6,SMD2_6] = smd(image6);

[Reblur1,Renoise1] = reblur_renoise(image1);
[Reblur2,Renoise2] = reblur_renoise(image2);
[Reblur3,Renoise3] = reblur_renoise(image3);
[Reblur4,Renoise4] = reblur_renoise(image4);
[Reblur5,Renoise5] = reblur_renoise(image5);
[Reblur6,Renoise6] = reblur_renoise(image6);

row1 = [NIQE1,NIQE2,NIQE3,NIQE4,NIQE5,NIQE6];
row2 = [Entropy1,Entropy2,Entropy3,Entropy4,Entropy5,Entropy6];
row3 = [TenenGrad1,TenenGrad2,TenenGrad3,TenenGrad4,TenenGrad5,TenenGrad6];
row4 = [SMD_1,SMD_2,SMD_3,SMD_4,SMD_5,SMD_6];
row5 = [Reblur1,Reblur2,Reblur3,Reblur4,Reblur5,Reblur6];

data=[row1;row2;row3;row4;row5];

images = {'Hazy Image','DCP','DCP_skyDetect','SSR','MSR','MSRCR'};
methods = {'NIQE','Entropy','TenenGrad','SMD','Reblur'};
column_name=strcat(images);
row_name=strcat(methods);

set(figure(2),'position',[200 200 650 200]);
uitable(gcf,'Data',data,'Position',[20 20 600 150],'Columnname',column_name,'Rowname',row_name);

h = 1;

end