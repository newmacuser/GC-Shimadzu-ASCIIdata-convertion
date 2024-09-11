#!/bin/bash
echo -e "\n"
echo -e "This is a shell script that processes Shimadzu GC ASCIIData output."
echo -e "Make sure the ASCIIData file and the SCFAs_v2.R script are in the same directory"
echo -e "Here is your current directory": $PWD "(Enter to confirm or put in a valid working path, e.g. /Users/your_name/Desktop/example)"
read dir

test () {
  x=`sed -n '/^--$/=' temp/compounds.txt | tail -n 1`
  y=`sed -n '$=' temp/compounds.txt`
  z=$((y-x))
  if [[ $z -le "4" ]]; then
    sed "$(( $(wc -l <temp/header.txt)-4+1 )),$ d" temp/header.txt > temp/header2.txt
    mv temp/header2.txt temp/header.txt
  fi
}

main () {
  echo -e "Enter the input file name (e.g. ASCIIData.txt)."
  read name
  if [[ -f "$name" ]]; then
    echo -e "running..."
    mkdir temp out
    grep -A 8 "\[Compound Results(Ch1)\]" $name > temp/compounds.txt
    grep -A 3 "\[Header\]" $name > temp/header.txt
    test
    R --vanilla -f SCFAs_v1.R --args $dir
  else
    echo -e "Wrong file name, ERROR exit"
    exit 0
  fi
}


if [[ "$dir" == "" ]]
then
  cd "$PWD" && dir="$PWD"
  echo -e "Make sure the working directory you just entered is correct": "$PWD"
  main
  echo -e "Finish"
else
  cd "$dir"
  echo -e "Make sure the working directory you just entered is correct": $PWD
  main
  echo -e "Finish"
fi

