# AtlasBasedTractographyUsingExploreDTI
An application of atlas based tractography in ExploreDTI that does not require the GUI.

To run the script, you need a DTI dataset converted to .mat file in ExploreDTI, an FA map of the dataset, a tract file, and your ROIs in nifti format. If you have all these files you can run the script and easily amend it to your own situation. 

I did a quick segmentation of the IFOF as an example using the default dataset (http://www.exploredti.com/exampledataset.htm). I ran whole brain tractography (DTI, not CSD) using the default parameters and made sure to have an FA map in nifti format (export stuff to..). Then I segmented the IFOF using two AND ROIs and converted these to volume masks in nifti format to be used in atlas based tractography.
Unfortunately the tract file is too big to upload so you'll have to carry this step out yourself if you want to test the script the way it is currently set up.


