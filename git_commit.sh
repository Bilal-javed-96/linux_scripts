#!/bin/bash
#bash script to find total given numbers of last commits in a given repo
#./<script_name> <numbers of commit you want to find> <repo url>
rm -rf repo_1
mkdir repo_1
echo 'directory created'
cd repo_1
echo ''$pwd''
git clone $2
echo 'cloning repository '$2''

text=$2

# Set space as the delimiter
IFS='/'
#Read the split words into an array based on space delimiter
read -a strarr <<< "$text"


# Print each value of the array by using the loop
for val in "${strarr[@]}";
do
    printf "$val\n"
done
printf $val

cd $val

touch commit.txt
git log --after "$1.days.ago" --all > commit.txt
sed -i '/commit/d' ./commit.txt
sed -i '/#C'*'/d' ./commit.txt
echo 'commit logs generated'
sendmail jm.bilal1996@gmail.com  < commit.txt
echo "sending email"
cd ..
cd ..
rm -rf repo_1/

