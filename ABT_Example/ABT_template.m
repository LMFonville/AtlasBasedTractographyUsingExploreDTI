%This is a small example script to set up the necessary parameters to run
%atlas-based tractography in ExploreDTI without requiring use of the GUI.
%To run the script as is, make sure you have the example data from
%ExploreDTI (http://www.exploredti.com/exampledataset.htm)
%in a folder and have exported the FA to a nifti file (export stuff to..) 
%and have carried out whole brain tractography so you have a tracts file.

%Make sure you add ExploreDTI and its subfolders to the Matlab path
addpath(genpath('path/to/exploreDTI'));

%Define the folders your files are in, I keep my ROI files and the output
%in separate folders.
DTI_folder = 'path/to/ABT_example';
ROI_folder = [DTI_folder filesep 'IFOF'];
ABT_output = [DTI_folder filesep 'ABT_output'];

%Specify the DTI files
DTIfiles = E_DTI_Get_files_from_folder(DTI_folder);
DTI = E_DTI_Get_DTI_files(DTIfiles);
tract = E_DTI_Get_tract_files(DTIfiles);
nifti_logical_idx = ~cellfun(@isempty,strfind(DTIfiles,'FA.nii'));
nifti_idx = find(nifti_logical_idx == 1);
FA_template = DTIfiles(nifti_idx);

%Specify the ROI files
ROIfiles = E_DTI_Get_files_from_folder(ROI_folder);
roi_logical_idx = ~cellfun(@isempty,strfind(ROIfiles,'nii'));
roi_idx = find(roi_logical_idx == 1);
ROIs = ROIfiles(roi_idx);
     
%Setup output names
[P, N, EXT] = fileparts(DTI{1}); %this just makes it easy to stick with a naming convention for files, see output
vol_ext = '_ABT_IFOF.mat'; %the extension for the output file
ROIoutput = [ABT_output filesep N vol_ext];

%Set up the parameter file
params = E_DTI_check_T_ROIs_ABT(FA_template{1}, ROIs);
%Check if parameters are successfully loaded
if params.suc==0
    disp('Atlas based tractography analysis stopped!')
    return;
end
params.segm_only = 0; %change to value 1 if you want to segment the streamlines
params.T_Length_range(1) = 0; %min length of streamlines to be included
params.T_Length_range(2) = Inf; %max length
params.Temp_fol = 'path/to/ExploreDTI/Source/Temp'; %changing this to a different folder doesn't seem to actually do anything
%keep this in mind when running the script; you can't run multiple instances at once since the same folder is used! 
%A quick workaround (for now) is to have multiple copies of ExploreDTI to run.

%Run the damn thing
try
   disp('Running atlas based tractography analysis...')
   E_DTI_Atlas_based_tractography_exe(DTI{1},tract{1},...
           ROIoutput,params);
   	catch me
	disp('Atlas based tractography failed!') %no news is good news!
end
