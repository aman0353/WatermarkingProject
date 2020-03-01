function y=ext_Watermark(A,B,C,alpha)
%Watermarking in DWT Using "haar" wavelets %
%This function creates an image file with name 'ExtractedWatermark.png' in same diectory%
%{
A=Original image;
B=Watermark image;
C=Watermarked image, The output image saved by watermark function;
alpha=factor of embedding;('Should be same as used while watermarking') 
 Example:
ext_watermark('E:\watermark\lena.png','E:\watermark\wm.png','E:\watermark\Watermarked.png')
%}

original=imread(A);
[m n p]=size(original);
[original_LL,original_LH,original_HL,original_HH]=dwt2(original,'haar');

water_mark=imread(B);
water_mark=imresize(water_mark,[m n]);
[water_mark_LL,water_mark_LH,water_mark_HL,water_mark_HH]=dwt2(water_mark,'haar');

wm=imread(C);
[wm_LL,wm_LH,wm_HL,wm_HH]=dwt2(wm,'haar');
extracted_watermark= (wm_LL-original_LL)/alpha;

ext=idwt2(extracted_watermark,water_mark_LH,water_mark_HL,water_mark_HH,'haar');
imwrite(uint8(ext),'ExtractedWatermark.png');
subplot(2,2,1)
imshow(original);
title('Original Image');
subplot(2,2,2)
imshow(water_mark)
title('Watermark');
subplot(2,2,3)
imshow(wm);
title('Watermarked image');
subplot(2,2,4)
imshow(uint8(ext));
title('extracted Watermarked image');

y='Succesfully';
end