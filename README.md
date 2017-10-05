# AtlasBasedTractographyUsingExploreDTI
An application of atlas based tractography in ExploreDTI that does not require the GUI.

This is an example of how to run atlas based tractography on the default example data that is available 
(http://www.exploredti.com/exampledataset.htm).  

Before running the script I made sure to have an FA map in nifti format (export stuff to...) and carried out whole brain tractography 
(DTI, not CSD) using default parameters. I did a quick segmentation of the IFOF using two AND_ROIs that were converted to volume masks
to be used in atlas based tractography. 

So to run the script, you need a DTI dataset converted to .mat file in ExploreDTI, an FA map of the dataset, a tract file, and your 
ROIs in nifti format. If you have all these files you can run the script and easily amend it to your own situation. 
