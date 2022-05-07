function [score1,score2,score3,score4,score5,score6] = ssim_6(image0,image1,image2,image3,image4,image5,image6)
score1 = ssim(image1,image0);
score2 = ssim(image2,image0);
score3 = ssim(image3,image0);
score4 = ssim(image4,image0);
score5 = ssim(image5,image0);
score6 = ssim(image6,image0);
end