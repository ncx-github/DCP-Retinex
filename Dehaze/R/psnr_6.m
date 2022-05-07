function [score1,score2,score3,score4,score5,score6] = psnr_6(image0,image1,image2,image3,image4,image5,image6)
score1 = psnr(image1,image0);
score2 = psnr(image2,image0);
score3 = psnr(image3,image0);
score4 = psnr(image4,image0);
score5 = psnr(image5,image0);
score6 = psnr(image6,image0);
end