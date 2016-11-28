function [ bootstrap_frames ] = getBootStrapFrames( K, images )
%GETBOOTSTRAPFRAMES calculates the bootstrap frames for the images
%and the calibration matrix K
idx = getNextKeyFrame(K, images, 1);
bootstrap_frames = [1, idx];

end

