---
layout: post
title:  Unix cmd hacks
subtitle: Powering automatization from the terminal
tags: programming
published: false
image: ../img/posts/word_cloud.jpg
date: 2020/3/20
---

## Introduction

@todo #13 add intro

## Display elapsed time from the start to the end of process

```shell script
start=$(date +%s) 
sleep 5
end=$(date +%s)
echo "The process lasted $(expr $end - $start) seconds." 
```

## Combine commands

```shell script
cat -n afile >result && rm afile # rm will be executed only if cat succeds
```

```shell script
touch afile 
copy afile bfile || echo Copy failed # the echo will be executed
```

## Loops

### For

Function that passes input timezone and convert it to a desire time zone. To use it, run `showtime Europe/Sweden America/La_Habana 11:45`

```shell script
showtime() 
{
   local TZIN=$1
   local TZOUT=$2
   local TIME=$3
   echo -n "$TZIN $TZOUT $TIME"
   TZ=$TZOUT date --date="TZ=\"$TZIN\" $TIME"
}
```

Use the `showtime`for different timezones.

```shell script
for i in Europe/London Europe/Paris Europe/Madrid; do
    showtime America/Los_Angeles $i 11:45
done
```

```shell script
TZONES='America/Los_Angeles America/New_York Europe/London'
for tzin in $TZONES; do
    for tzout in $TZONES; do
      showtime $$tzin $tzout 11:45
    done
done
```

### While

Computes the average number of characters per line across the files in a directory.

```shell script
ls | 
while read name ; do # For every entry
    if [ -f $name -a -r $name ] ; then # If is a regular file and readable
      echo -n "$name "
      expr $(wc -c <$name) / $(wc -l <$name)#display average characters per line
    fi
done |
head

```
## Conditionals

### If

Create two files, and check if `sourcefile` is older than `destfile`.

```shell script
touch sourcefile
touch destfile

# Make source newer than destination
if test [ soutcefile -nt destfile ] ; then
    cp sourcefile destfile
    echo Refreshed destfile
fi
```

### If-else

```shell script
if test [ soutcefile -nt destfile] ; then
   cp sourcefile destfile
   echo Refreshed destfile
else
   echo destfile is up to date
fi
```

## xargs

Executes the commands repeatedly to the output. Apply a set of commands as arguments to a command. The following program counts the number of lines of files in current directory

```shell script
find . -type f | # Output the name of all files
xargs cat | # Combining them by applying cat
wc -l # Count number of lines
```


# case

Allows to run specific command based on pattern matching.


```shell script
case $(uname) in Linux
```

## Data processing flow

```shell script
git clone gitrepo; cd gitrepo
git log --pretty=format:%aD master | # Fetch commit dates
cut -d, -f1 # Select the weekday
sort |      # Bring all weekdays together
uniq -c |   # Count all weekday occurrences
sort -rn     # Order by descending popularity
```

## Append a timestamp to a log file

```shell script
echo $(date): operation failed >>log-file
```



# Fetching data 


## From the web

We can invoke a web service to get some results and then pipe to `jq` to output the result in pretty-print format.

```shell script
curl -s "http://api.currencylayer.com/\                                     Thursday 26 March 07:04
live?access_key=$API_KEY&source=USD&currencies=EUR" | jq .
```
## From a MySQL database

```shell script
echo "SELECT COUNT(*) FROM projects" | # SQL query
mysql -ughtorrent -p ghtorrent # MySQL client and database
```

```shell script
echo 'select url from projects limit 3' | # Obtain URL of first three projects
mysql -ughtorrent -p ughtorrent | # Invoke MySQL client
while read url ; do
    curl -s $url | # Fetch project's details
    jq -r '{owner: .owner.login, name: .name, pushed: .pushed_at}' # Print owner, project, and last push time
done
```

# Archives

List the content of an archive file in the web without pushing its content in the disk.

```shell script
curl -Ls https://github.com/castor-software/depclean/archive/1.0.0.tar.gz | # Download tar file
tar -tzvf - | # -t list content, z- indicates zip compression, -v is verbose, -f retrieve file to the output of curl 
head -10 # list first 10 entries
```

Decompress the file in the disk

```shell script
curl -Ls https://github.com/castor-software/depclean/archive/1.0.0.tar.gz | # Download tar file
tar -xzf - 
```
Create and compress archives

```shell script
tar -czf share.tar.gz /usr/share
```

Using a sub-shell to pipe various commands

```shell script
mkdir dict2
(
    cd /usr/share/dict
    tar -cf - .
) | (
    cd dict2
    tar -xf -
)
ls dict2
```

Compressing the content of current directory

```shell script
ls -lR /home/joe >ls.out ; gzip ls.out

```


# Version Control

Who has performed the most commits?

```shell script
git log --pretty=format:%ae | # list each commit author email                                            Saturday  4 April 10:24 148 ↵
sort | # Bring emails together
uniq -c | # Count occurrence
sort -rn | # Order by number
head 
```

What is the file the largest number of changes?

```shell script
find . -type f -print |                                                         
    while read f ; do # For each file
    echo -n "$f " # Prints its name on a single line
    git log --follow --oneline $f | wc -l # Count the number of changes
    done |
    sort -k 2nr | # Sort by the second field in reverse numerical order
    head
```

What are the changes made to a file?

```shell script
git blame --line-porcelain src/main/java/spoon/Launcher.java | # obtain line metadata
head -15
```

Which author has contributed more to a file?

```shell script
git blame --line-porcelain src/main/java/spoon/Launcher.java |
grep "^author " | #Show each line's author
sort |  # Order by author
uniq -c | # Count author instances
sort -rn | # Order by count
head
```
What is the average date of all lines in a file?

```shell script
date +%s # show date in epoch
date -d @1585990273 # parse data from epoch to date
```

```shell script
date -d @$(
   git blame --line-porcelain src/main/java/spoon/Launcher.java |
   awk "/^author-time / {sum += $2; count++} # Maintain sum and count of commit times
   END {printf("%d", sum / count)}"
)
```

What is the evolution of the file size?

```shell script
file=src/main/java/spoon/Launcher.java # File to examine
git log --pretty=format:%H -3 $ $file # Show SHA of commmits
git log --pretty=format:%H $file | # Obtain commits' SHA
while read sha ; do # For each SHA
    git show $sha:$file | # List files stated at that commit
    wc -l
done |
head -15 # First 15 entries

```

# System administration

Unix store administrative date in `/etc` (stands for "extreme technical context")

# Generators

```shell script
for i in $(seq 50) ; do
    echo -n "." # displais 50 dots
done
```

# Regular expressions

## `grep`

```shell script
cd /usr/share/dict
grep baba words # All lines (words) containing baba
grep "^baba" words # All lines (words) starting with baba
grep "baba$" words # All lines (words) ending with baba
grep a.a.a.a words # Words containing a followed by anything
```

```shell script
grep "^t.y$" words # Three letter words starting with t, ending with y
grep "^....$" words | wc -l # Number of four letter words
grep "^k.*d.*k$" words # Words starting with k, ending with k, and with a d in between
grep "^a*b*c*d*e*f*g*h*i*j*k*l*m*n*o*p*q*r*s*t*u*v*w*x*y*z*$" words | wc -l # words that follow the alphabetical order
grep "[0-9]" words # Lines containing a digit
grep "^k.[bdgkpt].k$" words # Words with a hard consonant between ks
grep "^[A-Z]" words | wc -l # Number of proper nouns
grep "[^A-Za-z]" words # Lines with non-alphabetic characters
find ~/Downloads | grep "[[:space:]]" # List files with space characters
```

## `egrep` (or `grep -E`)

```shell script
grep -E "s{2}" words  # Words with two secuentical s characters
grep -E "[^aeiouy]{7}" words # Words with seven consonants
grep -E "^.{,15}$" words | wc -l # Words with a length up to 15
grep -E "^.{15,}$" words | wc -l # Words with at least 15 characters
grep -E "^(.).*\1$" words | head # Words beginning and ending with the same character (the character in parentesis is referenced with \1)
grep -E "^(.)(.)((.)\4)?\2\1$" words # Find 3-4 letter palindromes 
```

Alternative matches.

```shell script
grep -E "^(aba|ono).*(ly|ne)$" words # Words with alternative start/end parts
grep -l vfs *.c # List C files containing vfs
```

Matches in files (`grep -F`)
```shell script
grep -rl read_iter . | head -5 # Search recursively all the files that contain the string read_iter

grep -F ... *.c | head
```

# Other tools

## `cut`

```shell script
cd /etc/passwd
cut -d: -f 1 /etc/passwd | head -4 # Output the first field
```
## awk

```shell script
awk "/bash/" /etc/passwd # Output lines containing "bash"
awk -F: "$3 > 1000" /etc/passwd # Lines where field 3 > 1000
awk -F: "{print $1}" /etc/passw | head -5 # Output field 1
awk "!/^#/ {print $1}" /etc/services | head # Print first field that doesn't match the regular expression
```

### ack

ack - grep-like text finder

```shell script
ack --ruby foo # Find foo in occurrences in ruby files
ack abc -l # List files with the occurrence of abc character
```

# Processing

## Sorting

```shell script
sort -k 2 dates | head -5 # Sort by second and subsequent fields (space separated)
sort -k 4r dattes | head # Sorts in reverse order
sort -k 3M -k 2n dates | head  # sort 3rd field (Month) in chronological order, then second field (Month day) in numberical order

sort -t : -k 4n /etc/passwd | head # Sort by numeric group-id

sort -u /etc/passw | head # sort the unique elements
sort dates | sort -C && echo "Sorted"
```


The `comm` command allows to select or reject lines common to two files. Both files must be sorted.

```shell script
comm linux.bin freebsd.bin
```

# `sed`

## substitutions

Create JSON from list of items.

```shell script
vim tojson.sed

#!/bin/bash
li``
[ # Insert [ at the beginning
s/.*/ "&",/ # Convert lines into strings
$a\  # Append ] at the end
]
EOF

ls /usr | tojson.sed
```

# `awk`

Summarize size of of files in a directory.

```shell script
ll > contents.txt 
awk '                    
{ size += $5; n++ }  # Sum size and number of files
END {                # Print summary
print "Total size " size
print "Number of files " n
print "Average file size " size/n
}
' contents.txt
```

Count the number of file extension

```shell script
ll > contents.txt 
awk '
{
sub(".*/", "", $9)   # Remove path
if (!sub(".*\\.", "", $9))    # Keep only extension
next     # Skip files without extension
size[$9] += $5    # Tally size of extension
}
END {
for (i in size)
print i, size[i]
}' content.txt |
sort -k 2nr |
head
```

# `diff`

```shell script
diff -u a b
```

$ `patch`

```shell script
patch john.c <mary.patch # Patch John's copy with Mary's patch
```

# Testing and expressions

## `test`

```shell script
test -d / && echo Directory # Test if root is a directory
test -f / && echo File # Test if root is a file
test hi = there && echo Same # Test if strings are equal
test hi != hi && echo Different # Test if strings are different
test -z "" && echo Empty # Test if string is empty
test -n "a string" && echo Non-empty # Test if string is non empty
test 32 -eq 42 && echo Equal # Test integers are equal
test 32 -lt 50 && echo Less than # Test if integer less than other
test . -nt / && echo . is newer than / # Test if a file is newer than other
test -w / && echo Writable # Test if a file is writable
```

## `expr`

```shell script
expr 1 + 2
expr 2 \* 10
expr 12 \% 5
expr 10 \< 50
expr 5 = 12 # Test of equality
expr John \> Mary # Compare strings
expr \(1 + 20 \) \* 2
expr length "To be or not to be" # String length
expr substr "To be or not to vbe" 4 2 # Substring of 2 from 4
expr "" \| b # Short-circuit OR (first part failed)
```

```shell script
i=0
while [ $i -lt 10 ]; do
    echo $i
    i=$((i + 1))
done
```

# Dealing with characters

```shell script
echo 'This is a test' | tr ' ' - # Replace space with -
echo 'This is a test' | tr a-z A-Z # Replace a-z A-Z
```

## Encryption & Decription

```shell script
openssl enc -e -aes-256-cbc -pbkdf2 <pride-and-prejudice.txt >real-secret
freq real-secret
$ openssl enc -d -aes-256-cbc -pbkdf2 <real-secret | head
```

# Dealing with files

## `tac`

Print and concatenate files in reverse (last line first).

```shell script
ll | tac
```

## `rev`

```shell script
tail /usr/share/dict/words | rev # Reverse characters
```

## `paste`

```shell script
paste - /usr/share/dict/word
```

## `shuf`

```shell script
shuf -n 5 /usr/share/dict/words # Output five random words
shuf -n 1 -e heads tails # Throw a single coin
```
## split

```shell script
split -l 10000 -d /usr/share/dict/words # Split the dictionary
```

## `rs`

```shell script
head /etc/passwd | rs -c: -C: -T # Transposes the output
```


# Graphs

```shell script
cho "digraph talks {
        bob [gender="male"];
        eliza [gender="female"];
        fred [gender="male"];
        john [gender="male"];
        mary [gender="female"];
        steve [gender="male"];
        sue [gender="female"];
        mark [gender="male"];

        john -> mary;
        john -> bob;
        mary -> sue;
        sue -> bob;
        sue -> mary;
        fred -> bob;
        eliza -> steve;
}" > talk.dot
```
Count nodes

```shell script

gvpr 'N {clone($0, $)}' talk.dot # Clone each node to the output graph
gvpr

```




# References

- [Unix command specification](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/contents.html)
- [http://conqueringthecommandline.com](http://conqueringthecommandline.com)
- [The Missing Semester of Your CS Education](https://missing.csail.mit.edu/)
- [http://www.bashoneliners.com](http://www.bashoneliners.com)
- [https://www.commandlinefu.com](https://www.commandlinefu.com)
- [https://explainshell.com/](https://explainshell.com/)


















