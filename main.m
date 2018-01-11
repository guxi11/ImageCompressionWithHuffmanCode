% ----------------------------------------------------------
% Abstract:
% Use Huffman Method to encode the input img(grayscale, then 
% decode. Show the imgs through out the progression and
% compare the result with the input img.
% ----------------------------------------------------------

clc; close all; 
img=imread('../lib/lenna.bmp'); 
imgsize = size(img);
ycbcrimg = rgb2ycbcr(img);

SymString = reshape(ycbcrimg, [1, prod(imgsize)]);
[BitStringInUint8, SymCodeTable] = HuffEncode(SymString);
cr = (prod(imgsize) * 8) / length(BitStringInUint8); % compressionratio
Decoded = HuffDecode(BitStringInUint8, SymCodeTable);

decoded_img = reshape(Decoded, imgsize);
decoded_img = ycbcr2rgb(decoded_img);

subplot(1,2,1);imshow(img);title('original img');
subplot(1,2,2);imshow(decoded_img);title('huffman decoded'); 
imwrite(decoded_img, '../lib/lenna1.bmp');

thepsnr = PSNR(img, decoded_img);
thessim = ssim(img, decoded_img);
disp(['     压缩率', '       PSNR', '   SSIM']);
disp([cr, thepsnr, thessim]);
