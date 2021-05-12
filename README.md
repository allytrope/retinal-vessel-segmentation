# retinal-vessel-segmentation
A tool for binarizing retinal blood vessel images.

## Usage
Retinal images with ```.ppm``` extension should be placed in the ```input``` folder for processing. After running ```main.matlab```,
the binarized images will be generated inside the ```output``` folder.
New file names will generate with the pattern: ```im0001.ppm``` -> ```im0001.output.ppm```.

## Results
This program was tuned using 20 images from the [STARE](https://cecas.clemson.edu/~ahoover/stare/) dataset,
a collection of retinal images, to develop and test the process on.
Using manually determined "ground truth" images created by expert Adam Hoover for the 20 STARE images,
the average statistics for the binarized images are as follows:
* True positive rate = 0.89
* Truge negative rate = 0.67
* Balanced accuracy = 0.78

Created by [allytrope](https://github.com/allytrope) and [TheFeefster](https://github.com/TheFeefster).
