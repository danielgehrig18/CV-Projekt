%% Libraries
%   vlfeat for SIFT

%% choose dataset
%   - request data set path from user
%   - load data set

%% initilize point correspondences
%   - Initialize intitial image
%   - feature detection in first image (Harris, Sift, Shi-Tomasi, ...) (Ex 3)
%   - feature description in first image (Brisk, Fast, Orb, HOG)
%   
%   -initialize tranlation to 0
%   
%   for next image in subsequent images do:
%   - feature detection in next image (...) (Ex 3)
%   - feature description in next image (...) (Ex 3) 
%   - match descriptions in next image with first image (SSD, Hamming
%       distance, Intensity invariance) (Ex 3)
%   - remove outliers (RANSAC) (Ex 6)
%   - calculate translation and rotation with 8 pt algorithm (Ex 5)
%   - with translation and rotation calculate 3D point cloud (Ex 4)  
%   until: translation exceeds 0.1 * average 3D point cloud depth. Then set
%          last image to key image
%       
%   Calculate 3D point clouds with standard K, M and key frames use as reference

%% in loop match all subsequent images with point clouds and update point
% load standard 3D point cloud from first step
% initialize key image with features from previous step
%
% for image in dataset:
%     find next key image
%     for next image in subsequent image do:
%         - feature detection in next image (...) (Ex 3)
%         - feature description in next image (...) (Ex 3) 
%         - match features in next image with features in key image
%         - match point cloud in previous key image frame with 2D features in next image
% 
%         for iteration in iterations:
%             - randomly choose 3 correspondences
%             - calculate R, T with P3P
%             - reproject 3D point cloud on next image to get pixel coordinates
%             - calculate inliers and retain R and T with maximal inlier number.
%             - update R and T if more inliers than best and update best
%         end
% 
%         - with inlier matches determine R and T of next image with DLT    
% 
%         - calculate 3D point cloud of next image features with R and T above.
%           (Ex: 4, Section 4 )
% 
%     until: length of T exceeds 0.1 * average distance of 3D point cloud next image plane. 
%            Then set next image to new key image.
%     
%     
%     save R, T and key image.
%     
%     - If features of key image in Bag of Words (BoW)
%         - apply loop closure with bundle adjustment
%     - Add new features to BoW
%
%     Every N cycles do:
%         - Camera Pose Graph Optimization (before BA)
%         - Bundle Adjustment -> improve R and T