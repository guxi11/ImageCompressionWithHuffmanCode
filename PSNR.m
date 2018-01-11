function PSNR = PSNR(input_img1, input_img2)

% ------------------------------------------------------------------------
% PSNR(Peak Signal-to-Noise Ratio)
% ---
% Input:
%     input_img1
%     input_img2 (these two images can have different sizes.)
% Output:
%     PSNR
% ------------------------------------------------------------------------

input_img1 = double(input_img1);
input_img2 = double(input_img2);
if size(input_img1,3) == 3
    input_img1 = rgb2ycbcr(input_img1);
    input_img1 = input_img1(:,:,1);
end
if size(input_img2,3) == 3
    input_img2 = rgb2ycbcr(input_img2);
    input_img2 = input_img2(:,:,1);
end
min_size = min([size(input_img1); size(input_img2)]);
M = min_size(1);
N = min_size(2);
MSE = 0;
for j = 1:M
    for i = 1:N
        MSE = MSE + (input_img1(j, i) - input_img2(j, i)).^2;
    end
end

MSE = MSE / (M * N);
MAX1 = 255;
PSNR = 20 * log10(MAX1/sqrt(MSE));

return
