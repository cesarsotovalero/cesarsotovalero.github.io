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

TODO

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






































