# Reformatting ASCIIData output of SCFAs to a summary table
## Purpose:
This is a shell script for parsing concentration information of SCFAs from Shimadzu GC ASCII data output.

Only the modified GC technique (created by Miguel in Fall 2022) that measures 14 volatile chemicals is compatible with the script.
(To acquire the appropriate ASCIIData output file, please refer to Miguel's data analysis methodology [https://purdue.app.box.com/folder/131931315173]).

The output summary table has 15 columns with the following headers: “SampleID”, "Acetone", "Methanol", "2-Propanol", "Ethanol", "1-butanol", “Acetate”, “Propionate”, “Isobutyrate”, “Butyrate”, “Isovalerate”, "Valerate", “Isocorporate”, "Hexanoic acid", "Heptanoic acid". Compound concentrations are represented by the values in the table (mM). 

## Prerequisite: 
1. Platform: a computer capable of running shell scripts.
E.g., linux/unix, mac or Windows-Subsystem-for-Linux (WSL)

2. Installed R language.
Check that you can access R from Terminal (simply type 'R' in your Terminal to get the version information; otherwise, please install R first [https://cran.r-project.org].

## Steps:
1. Open a new Terminal on your computer and change directory to the path of your scripts and data file (e.g. change to the path of ‘example’ folder on Desktop). 
 
2. Make sure there are three files in the folder:

•	make_table_for_SCFAs_raw_data_Shimadzu_v2.sh

•	SCFAs_v2.R

•	ASCIIData.txt (replace your own data file here, which can have a different name)

3. In Terminal, type in “bash make_table_for_SCFAs_raw_data_Shimadzu_v2.sh” 
 
4. Following the instruction pop-up from the terminal. First, you will need to enter a working directory of your data file and script files.
 
Note: absolute path without any space is preferred. Be careful about spaces in your path. If you have spaces in your path, add “\” before any space. (e.g.: “/User/Desktop\ file/example”. 
5. Then, you will need to type in your data file name (with extension name) and hit enter. (e.g. ASCIIData.txt). Be careful about spaces in file names as well. 
6. You can now find the summary SCFAs table in the “out” folder of your current folder.



