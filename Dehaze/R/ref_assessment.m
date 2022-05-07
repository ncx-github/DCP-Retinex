function h = ref_assessment(image0,image1,image2,image3,image4,image5,image6)

[psnr1,psnr2,psnr3,psnr4,psnr5,psnr6] = psnr_6(image0,image1,image2,image3,image4,image5,image6);

[ssim1,ssim2,ssim3,ssim4,ssim5,ssim6] = ssim_6(image0,image1,image2,image3,image4,image5,image6);

row1 = [psnr1,psnr2,psnr3,psnr4,psnr5,psnr6];
row2 = [ssim1,ssim2,ssim3,ssim4,ssim5,ssim6];
data = [row1;row2];
images = {'Hazy Image','DCP','DCP_skyDetect','SSR','MSR','MSRCR'};
methods = {'PSNR','SSIM'};
column_name=strcat(images);
row_name=strcat(methods);
set(figure(3),'position',[200 200 650 120]);
uitable(gcf,'Data',data,'Position',[20 20 600 90],'Columnname',column_name,'Rowname',row_name);
h = 1;
end