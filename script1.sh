#!/bin/bash
#20191021BN

#Create MY_DIR directory
mkdir MY_DIR;
echo "MY_DIR directory created.";

#Create My_dir directory:
cd MY_DIR;
mkdir My_dir;
echo "MY_DIR/My_dir directory created.";

#Navigate into the My_dir directory
cd My_dir;

#For loop for creating files
for (( i=1; i<=15; i++ ))
do
    j=$(expr $i + 1)
    echo "File fileA_${i}" >> fileA_${i}.txt;
    if [[ $i == 15 ]];
    then
        echo "No successor" >> fileA_${i}.txt;
    else
        echo "Next file fileA_${j}" >> fileA_${i}.txt;
    fi
done

#Print out all files
echo "Regular files of subdirectory My_dir of directory MY_DIR:";
find . -maxdepth 1 -type f

#Show contents of all files
echo "Created files contents:"
for (( i=1; i<=15; i++ ))
do
    echo "fileA_${i}.txt:";
    cat fileA_${i}.txt;
done

#Move files based on numbers
for (( i=1; i<=15; i++ ))
do
    #x = grep '1\|2\|3' fileA_${i}.txt;
    cat fileA_${i}.txt;
done

#Move files based on numbers
for (( i=1; i<=15; i++ ))
do
    if [[ -n `grep '1\|2\|3' fileA_${i}.txt` ]];
    then
        #cat fileA_${i}.txt >> ../BAG;
        mv fileA_${i}.txt ..
    fi
done

cd ..

echo "Regular files of directory MY_DIR:";
find . -maxdepth 1 -type f;

#Write the contents to BAG
for (( i=1; i<=15; i++ ))
do
    if [[ -n `grep '1\|2\|3' fileA_${i}.txt` ]];
    then
        cat fileA_${i}.txt >> BAG;
    fi
done

#Remove everything but BAG
ls --hide=BAG | xargs rm

echo "Regular files of directory MY_DIR:";
find . -maxdepth 1 -type f;

echo "File BAG:"
cat BAG

cd My_dir
echo "All regular files of MY_DIR/My_dir:";
find . -maxdepth 1 -type f;

for (( i=4; i<=8; i++ ))
do
    cat fileA_${i}.txt >> bag;
done

#Remove everything but bag
ls --hide=bag | xargs rm

echo "All regular files of My_dir"
find . -maxdepth 1 -type f;

#Display everything in the `bag` file
echo "File bag:"
cat bag;

cd ..
cd ..

#Remove everything in the directory
rm -rf MY_DIR
