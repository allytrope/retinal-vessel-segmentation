function [segmentedImage] = imsegment(im)
    % IMSEGMENT Segments blood vessels from retinal images
    % Retinal blood vessels are made white and the background black
    
    % Color channel
    [red, green, ~] = imsplit(im); % Red used for border detection later
    
    % Contrast enhancement of gray image using CLAHE
    contrasted = adapthisteq(green,'numTiles',[2 2],'nBins', 256);
    
    % Creates blurred image
    filter = fspecial('average', [9 9]);
    smoothed = imfilter(contrasted, filter);
    
    % Takes the difference between the grayscale and blurred images
    edges = imsubtract(smoothed, contrasted);
    
    % Makes image black and white
    binarized = imbinarize(edges);
    
    % Removes connected components with fewer than 25 pixels
    opened = bwareaopen(binarized, 25);
    
    % Fills in empty spaces within vessels
    se = strel('disk', 2);
    closed = imclose(opened, se);
    
    % Constructing border detection
    [m,n] = size(red);
    border = ones(m,n);
    for i = 1:m
        for j = 1:n
            if red(i,j) < 36
                border(i,j) = 0;
            else
                border(i,j) = 255;
            end
        end
    end
    
    % Erasing borders
    borderless = closed;
    for i = 1:m
        for j = 1:n
            if border(i,j) == 0
                borderless(i,j) = 0;
            end
        end
    end
    segmentedImage = borderless;
end
