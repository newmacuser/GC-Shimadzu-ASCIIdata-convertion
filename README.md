# Reformatting ASCIIData output of SCFAs to a summary table
## Purpose:
This is a shell script for parsing concentration information of SCFAs from Shimadzu GC ASCII data output.
The script is only compatible with the updated GC method (Miguel developed in Fall 2022) that measures 14 volatile compounds. (To obtain the right ASCIIData output file, please follow Miguel’s data analysis protocol [https://purdue.app.box.com/folder/131931315173]). The output summary table contains 15 columns with headers of: “SampleID”, "Acetone", "Methanol", "2-Propanol", "Ethanol", "1-butanol", “Acetate”, “Propionate”, “Isobutyrate”, “Butyrate”, “Isovalerate”, "Valerate", “Isocorporate”, "Hexanoic acid", "Heptanoic acid" and with concentration values for each SampleID.
