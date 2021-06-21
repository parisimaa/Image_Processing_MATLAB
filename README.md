# Image_Processing_Matlab
## Description:
Each folder consists some problems covering different fundamental concepts in Image Processing. <br>
Also, you may want to learn more about the theories by reading this refrence: Digital Image Processing, Rafael C. Gonzalez - Richard E. Woods <br>
### Problem set 1: 
Use imag1.tiff and imag2.tiff files to create following results in MATLAB. <br>
<img width="482" alt="result1" src="https://user-images.githubusercontent.com/54392924/117450360-5dc26000-af56-11eb-952a-9ef9ad27d790.png">

### Problem set 2: 
Change the imag3.tiff light intensity using following transformation and show the result.  <br>
<img width="652" alt="result2" src="https://user-images.githubusercontent.com/54392924/117450369-62871400-af56-11eb-967e-3b28db0835f8.png">
### Problem set 3: Image Quantization
Use the car image <br>
1. Read this image using MATLAB function and store in "color_car" array. Then transfer it to grayscale and show both images. 
2. For grayscale and each RGB channel calculate below measurments: 
   * Maximum and minimum intensity
   * Average of intensity
   * Variance of intensity
3. Try holding each RGB channel at a time and reset the two other channels to zero. Show the results. Which color channels has the most information of the image in this case? Which color will appear black or white and why? 
4. Now invert the value of each color channel(Hint: Maximum intensity - pixel's intensity) and show the results. 
5. Elminate ONLY one color channel by assigning zero to it each time. Eliminating which color channel does the least damage to the image?
6. According to part-2 if we want to use only 4,3,2 bits ( totally 9 bits) to depict different color channels, how would you allocate these bits to each color channel in order to have the least damage to the image's information?
7. Find the components' value for CIE XYZ, RGB image. 
8. Repeat part-6 for this system. 

### Problem set 4: Image Sampling
Use the tree image <br>
1. Quarter the number of pixels in the image in the horizontal direction. Show image.
2. Quarter the number of pixels in the image in the vertical direction. Show image.
3. Halve the number of pixels in the image in both directions. Show image. Which image do you think is most damaged?
4. Now resize the images. To do so, insert a bar of pixels between two row or column or both (it depends on the image) and use one of below methods until you reach the image original size:
   * The intensity of each missing pixel is the intensity value of the neighbor to the top, left or top-left (each of which was available in image). **HINT IN FOLDER**
   * The intensity of each missing pixel is the average of the two nearest pixel to the missing one (If there is only one, consider the value of both equal). **HINT IN FOLDER**
   * For each image obtained, calculate the SNR PSNR and MSE between the original image and the created image. Intuitively, which of the above two methods do you think works best for each image?


### Problem set 5:
### Problem set 6:

## Contact:
parisima.abdali@gmail.com
