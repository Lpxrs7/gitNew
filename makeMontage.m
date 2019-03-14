function [ m ] = makeMontage(data, map)
% The user calls the function from the command line with a filename and a
% number that specifies how many images / tiles to display.
%
% . E.g. makeMontage('dafni_01_FSL_7_1.nii', 25)

%% 1. load data

% data = niftiread('dafni_01_FSL_7_1.nii');


%% 2. prepare data for visualisation
% In this example^ images are stored in a 3D cube
% Image acquisition is in the saggital direction

% Dimensions 2 and 3 in these anatomical images are in an order that does
% not produce axial images

% Permute data.  Try different versions to understand how permuting data works 
% dataPermuted = permute(data, [ 1, 3, 2 ]);
% dataPermuted = permute(data, [ 1, 3, 4, 2 ]); add singleton 3rd dimension
%

dPermutedForMontage = permute(data, [1, 3, 4, 2]);

%% 3. Display Range

% Calculate percentiles

Lprct = prctile(data(:), 05);
Hprct = prctile(data(:), 95);

%% Montage output

map = 25; % Test - example input

figure
montage(dPermutedForMontage, 'Indices', 1:map, ...
    'DisplayRange', [Lprct, Hprct]);





end

