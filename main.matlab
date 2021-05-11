% NOTE: This file should be in the same folder as imsegment.m with subfolder "input".
% Images to be segmented should go in the input folder.
images = dir('input/*.ppm');
warning off
mkdir output

for n = 1:size(images, 1)
% Reads names of files and opens
    im = images(n);
    [~, im_filename, im_ext] = fileparts(strcat(im.folder, "/", im.name));
    im = imread(strcat('input/', im.name));
    
    % Calls imsegment.m
    segmentedIm = imsegment(im);
    
    % Saves segmented image in output folder
    imwrite(segmentedIm, strcat('output/', im_filename, '.output', im_ext))
end
