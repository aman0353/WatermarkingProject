function y=watermark(A,B,alpha)
%Watermarking in DWT Using "haar" wavelets %
%{
A=Original image;
B=Watermark image;
alpha=factor of embedding normally used 0.03;

 Example:
watermark('E:\watermark\lena.png','E:\watermark\wm.png')
%}
%{
This function creates an image file with name 'Watermarked.png' in same diectory
%}
host=imread(A);
[m n p]=size(host);
subplot(1,3,1)
imshow(host);
title('Original Image');
[host_LL,host_LH,host_HL,host_HH]=dwt2(host,'haar');
water_mark=imread(B);
water_mark=imresize(water_mark,[m n]);
subplot(1,3,2)
imshow(water_mark)
title('Watermark');
[water_mark_LL,water_mark_LH,water_mark_HL,water_mark_HH]=dwt2(water_mark,'haar');
water_marked_LL = host_LL + (alpha*water_mark_LL);
watermarked=idwt2(water_marked_LL,host_LH,host_HL,host_HH,'haar');
subplot(1,3,3)
imshow(uint8(watermarked));
title('Watermarked image');
imwrite(uint8(watermarked),'Watermarked.png');
y='Succesfully';
end