# Single image haze removal using Dark Channel Prior and Retinex
## Caution
Strictly speaking, I'm not the original creator of this program. I just integrated several popular programs.
## How to use it?
Run demo.m, choose mode 1 or mode 2, select a hazy image, for mode 2 you should choose an extra reference image. 
## What's in these folders？
### 1. functions
Functions for Dark Channel Prior (DCP), Dark Channel Prior with sky detect, Single-Scale Retinex (SSR), Multi-Scale Retinex (MSR) and Multi-Scale Retinex with Color Restoration (MSRCR).
### 2. functions4DCP
Supporting functions for Dark Channel Prior.
### 3. functions4Retinex
Supporting functions for Retinex.
### 4. NR
Functions for no-reference assessment, including NIQE, Entropy, TenenGrad, SMD and Reblur.
### 5. R
Functions for reference assessment, including PSNR and SSIM.
### 6. test_images
Some images for testing.
## To understand this program better...
You should read these papers:
> [1] He, Kaiming, Jian Sun, and Xiaoou Tang. "Single image haze removal using dark channel prior." IEEE transactions on pattern analysis and machine.
> 
> [2] He, Kaiming, Jian Sun, and Xiaoou Tang. "Guided image filtering." IEEE transactions on pattern analysis and machine intelligence 35.6 (2012): 1397-1409.
> 
> [3] Salazar-Colores, Sebastián, et al. "Fast single image defogging with robust sky detection." IEEE access 8 (2020): 149176-149189.
> 
> [4] Land, Edwin H., and John J. McCann. "Lightness and retinex theory." Josa 61.1 (1971): 1-11.
> 
> [5] Rahman, Zia-ur, Daniel J. Jobson, and Glenn A. Woodell. "Multi-scale retinex for color image enhancement." Proceedings of 3rd IEEE international conference on image processing. Vol. 3. IEEE, 1996.
> 
> [6] Wang, Jinbao, et al. "Single image dehazing based on the physical model and MSRCR algorithm." IEEE Transactions on Circuits and Systems for Video Technology 28.9 (2017): 2190-2199.
