# Depth-estimation-using-focal-stack-CNN
Depth estimation using focal stack CNN

I have added 2 more codes:
data_generation_image.m, and
shuffle_image.m

this is specifically for my data, you might not need to use it.

data_generation_image.m helps create the input image for the CNN, 
the input image contains the 5 x 5 image patches for all 81 focal stack images
concatenated with the last 5 x 5 patch being the average of the 81 images to estimate the all-in-focus patch.

shuffle_image.m helps shuffle the input and output images so that the input and output images are the corresponding pairs. 

the main code assumes that the train, validation and test images are in the separate folders.


