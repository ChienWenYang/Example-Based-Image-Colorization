# Example-Based-Image-Colorization-Using-Primal-Dual-Algorithm-and-Saliency-Screening

This matlab pseudo code is for "Example-Based Image Colorization Using Primal-Dual Algorithm and Saliency Screening".

## Requirements
Matlab R2020b


## Usage
1. Put the test image into the "input" directory. Grayscale images are named with the prefix "gray_" and the corresponding reference images are with prefix "ref_".
The images pairs in the directory are collected from previous publications.
2. Run 'demo.m'.
3. Results will be generated in the "output" directory.

## Third-party source codes
The third-party source codes in the directory "3rdparty" are from these sources.
* A. Levinshtein, A. Stere, K. N. Kutulakos, D. J. Fleet, S. J. Dickinson, and K. Siddiqi, “Turbopixels: Fast superpixels
using geometric flows,” IEEE transactions on pattern analysis and machine intelligence, vol. 31, no. 12, pp. 2290–
2297, 2009.

* E. Tola, V. Lepetit, and P. Fua, “Daisy: An efficient dense descriptor applied to wide-baseline stereo,” IEEE 
transactions on pattern analysis and machine intelligence, vol. 32, no. 5, pp. 815–830, 2009.

* W. Zhu, S. Liang, Y. Wei, and J. Sun, “Saliency optimization from robust background detection,” in Proceedings 
of the IEEE conference on computer vision and pattern recognition, 2014, pp. 2814–2821.

* X. Guo, Y. Li, J. Ma, and H. Ling, “Mutually guided image filtering,” IEEE transactions on pattern analysis and 
machine intelligence, 2018.
