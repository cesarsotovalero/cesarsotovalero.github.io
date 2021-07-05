---
layout: post
title:  Unix cmd hacks
subtitle: Boosting automation from the shell
tags: programming
keywords: unix, command line, scripts, tools
description: Personal notes of the edX course titled Unix Tools Data, Software and Production Engineering.
published: true
image: https://cf.jare.io/?u=https://www.cesarsotovalero.net/img/posts/unix_course.jpg
share-img: https://cf.jare.io/?u=https://www.cesarsotovalero.net/img/posts/unix_course.jpg
show-avatar: false
date: 2020/5/23
---

I want to share my personal notes of the [edX](www.edx.org) course [Unix Tools: Data, Software and Production Engineering](https://www.edx.org/course/unix-tools-data-software-and-production-engineering), by Prof. Diomidis Spinellis. I attended this course from March to June, 2020. It was my first MOOC experience. I have to say that I learned a lot in this course, and it makes me consider online education very seriously, as it provides an excellent way of learning from top courses, given by top universities, and tough by top experts in the world.
<aside class="quote">
    <em>"Being able to interact flexibly, swiftly, and efficiently with the underlying data and software systems is an indispensable skill"</em> ― Diomidis Spinellis 
</aside>
These notes are not organized in any specific manner. So, they are actually a bunch of very disordered Unix command line hacks and tricks :grin:.

## Display elapsed time from the start to the end of process

{% highlight bash linenos %}
start=$(date +%s) 
sleep 5
end=$(date +%s)
echo "The process lasted $(expr $end - $start) seconds." 
{% endhighlight %}

## Combine commands

{% highlight bash linenos %}
cat -n afile >result && rm afile # rm will be executed only if cat succeds
{% endhighlight %}

{% highlight bash linenos %}
touch afile 
copy afile bfile || echo Copy failed # the echo will be executed
{% endhighlight %}

## Loops

### For

Function that passes input timezone and convert it to a desire time zone. To use it, run `showtime Europe/Sweden America/La_Habana 11:45`

{% highlight bash linenos %}
showtime() 
{
   local TZIN=$1
   local TZOUT=$2
   local TIME=$3
   echo -n "$TZIN $TZOUT $TIME"
   TZ=$TZOUT date --date="TZ=\"$TZIN\" $TIME"
}
{% endhighlight %}

Use the `showtime`for different timezones.

{% highlight bash linenos %}
for i in Europe/London Europe/Paris Europe/Madrid; do
    showtime America/Los_Angeles $i 11:45
done
{% endhighlight %}

{% highlight bash linenos %}
TZONES='America/Los_Angeles America/New_York Europe/London'
for tzin in $TZONES; do
    for tzout in $TZONES; do
      showtime $$tzin $tzout 11:45
    done
done
{% endhighlight %}

### While

Computes the average number of characters per line across the files in a directory.

{% highlight bash linenos %}
ls | 
while read name ; do # For every entry
    if [ -f $name -a -r $name ] ; then # If is a regular file and readable
      echo -n "$name "
      expr $(wc -c <$name) / $(wc -l <$name)#display average characters per line
    fi
done |
head
{% endhighlight %}
## Conditionals

### If

Create two files, and check if `sourcefile` is older than `destfile`.

{% highlight bash linenos %}
touch sourcefile
touch destfile

# Make source newer than destination
if test [ soutcefile -nt destfile ] ; then
    cp sourcefile destfile
    echo Refreshed destfile
fi
{% endhighlight %}

### If-else

{% highlight bash linenos %}
if test [ soutcefile -nt destfile] ; then
   cp sourcefile destfile
   echo Refreshed destfile
else
   echo destfile is up to date
fi
{% endhighlight %}

## xargs

Executes the commands repeatedly to the output. Apply a set of commands as arguments to a command. The following program counts the number of lines of files in current directory

{% highlight bash linenos %}
find . -type f | # Output the name of all files
xargs cat | # Combining them by applying cat
wc -l # Count number of lines
{% endhighlight %}


## case

Allows to run specific command based on pattern matching.


{% highlight bash linenos %}
case $(uname) in Linux
{% endhighlight %}

## Data processing flow

{% highlight bash linenos %}
git clone gitrepo; cd gitrepo
git log --pretty=format:%aD master | # Fetch commit dates
cut -d, -f1 # Select the weekday
sort |      # Bring all weekdays together
uniq -c |   # Count all weekday occurrences
sort -rn     # Order by descending popularity
{% endhighlight %}

## Append a timestamp to a log file

{% highlight bash linenos %}
echo $(date): operation failed >>log-file
{% endhighlight %}



# Fetching data 


## From the web

We can invoke a web service to get some results and then pipe to `jq` to output the result in pretty-print format.

{% highlight bash linenos %}
curl -s "http://api.currencylayer.com/\                                     Thursday 26 March 07:04
live?access_key=$API_KEY&source=USD&currencies=EUR" | jq .
{% endhighlight %}
## From a MySQL database

{% highlight bash linenos %}
echo "SELECT COUNT(*) FROM projects" | # SQL query
mysql -ughtorrent -p ghtorrent # MySQL client and database
{% endhighlight %}

{% highlight bash linenos %}
echo 'select url from projects limit 3' | # Obtain URL of first three projects
mysql -ughtorrent -p ughtorrent | # Invoke MySQL client
while read url ; do
    curl -s $url | # Fetch project's details
    jq -r '{owner: .owner.login, name: .name, pushed: .pushed_at}' # Print owner, project, and last push time
done
{% endhighlight %}

# Archives

List the content of an archive file in the web without pushing its content in the disk.

{% highlight bash linenos %}
curl -Ls https://github.com/castor-software/depclean/archive/1.0.0.tar.gz | # Download tar file
tar -tzvf - | # -t list content, z- indicates zip compression, -v is verbose, -f retrieve file to the output of curl 
head -10 # list first 10 entries
{% endhighlight %}

Decompress the file in the disk

{% highlight bash linenos %}
curl -Ls https://github.com/castor-software/depclean/archive/1.0.0.tar.gz | # Download tar file
tar -xzf - 
{% endhighlight %}
Create and compress archives

{% highlight bash linenos %}
tar -czf share.tar.gz /usr/share
{% endhighlight %}

Using a sub-shell to pipe various commands

{% highlight bash linenos %}
mkdir dict2
(
    cd /usr/share/dict
    tar -cf - .
) | (
    cd dict2
    tar -xf -
)
ls dict2
{% endhighlight %}

Compressing the content of current directory

{% highlight bash linenos %}
ls -lR /home/joe >ls.out ; gzip ls.out

{% endhighlight %}


# Version Control

Who has performed the most commits?

{% highlight bash linenos %}
git log --pretty=format:%ae | # list each commit author email                                            Saturday  4 April 10:24 148 ↵
sort | # Bring emails together
uniq -c | # Count occurrence
sort -rn | # Order by number
head 
{% endhighlight %}

What is the file the largest number of changes?

{% highlight bash linenos %}
find . -type f -print |                                                         
    while read f ; do # For each file
    echo -n "$f " # Prints its name on a single line
    git log --follow --oneline $f | wc -l # Count the number of changes
    done |
    sort -k 2nr | # Sort by the second field in reverse numerical order
    head
{% endhighlight %}

What are the changes made to a file?

{% highlight bash linenos %}
git blame --line-porcelain src/main/java/spoon/Launcher.java | # obtain line metadata
head -15
{% endhighlight %}

Which author has contributed more to a file?

{% highlight bash linenos %}
git blame --line-porcelain src/main/java/spoon/Launcher.java |
grep "^author " | #Show each line's author
sort |  # Order by author
uniq -c | # Count author instances
sort -rn | # Order by count
head
{% endhighlight %}
What is the average date of all lines in a file?

{% highlight bash linenos %}
date +%s # show date in epoch
date -d @1585990273 # parse data from epoch to date
{% endhighlight %}

{% highlight bash linenos %}
date -d @$(
   git blame --line-porcelain src/main/java/spoon/Launcher.java |
   awk "/^author-time / {sum += $2; count++} # Maintain sum and count of commit times
   END {printf("%d", sum / count)}"
)
{% endhighlight %}

What is the evolution of the file size?

{% highlight bash linenos %}
file=src/main/java/spoon/Launcher.java # File to examine
git log --pretty=format:%H -3 $ $file # Show SHA of commmits
git log --pretty=format:%H $file | # Obtain commits' SHA
while read sha ; do # For each SHA
    git show $sha:$file | # List files stated at that commit
    wc -l
done |
head -15 # First 15 entries

{% endhighlight %}

# System administration

Unix store administrative date in `/etc` (stands for "extreme technical context")

# Generators

{% highlight bash linenos %}
for i in $(seq 50) ; do
    echo -n "." # displais 50 dots
done
{% endhighlight %}

# Regular expressions

## `grep`

{% highlight bash linenos %}
cd /usr/share/dict
grep baba words # All lines (words) containing baba
grep "^baba" words # All lines (words) starting with baba
grep "baba$" words # All lines (words) ending with baba
grep a.a.a.a words # Words containing a followed by anything
{% endhighlight %}

{% highlight bash linenos %}
grep "^t.y$" words # Three letter words starting with t, ending with y
grep "^....$" words | wc -l # Number of four letter words
grep "^k.*d.*k$" words # Words starting with k, ending with k, and with a d in between
grep "^a*b*c*d*e*f*g*h*i*j*k*l*m*n*o*p*q*r*s*t*u*v*w*x*y*z*$" words | wc -l # words that follow the alphabetical order
grep "[0-9]" words # Lines containing a digit
grep "^k.[bdgkpt].k$" words # Words with a hard consonant between ks
grep "^[A-Z]" words | wc -l # Number of proper nouns
grep "[^A-Za-z]" words # Lines with non-alphabetic characters
find ~/Downloads | grep "[[:space:]]" # List files with space characters
{% endhighlight %}

## `egrep` (or `grep -E`)

{% highlight bash linenos %}
grep -E "s{2}" words  # Words with two secuentical s characters
grep -E "[^aeiouy]{7}" words # Words with seven consonants
grep -E "^.{,15}$" words | wc -l # Words with a length up to 15
grep -E "^.{15,}$" words | wc -l # Words with at least 15 characters
grep -E "^(.).*\1$" words | head # Words beginning and ending with the same character (the character in parentesis is referenced with \1)
grep -E "^(.)(.)((.)\4)?\2\1$" words # Find 3-4 letter palindromes 
{% endhighlight %}

Alternative matches.

{% highlight bash linenos %}
grep -E "^(aba|ono).*(ly|ne)$" words # Words with alternative start/end parts
grep -l vfs *.c # List C files containing vfs
{% endhighlight %}

Matches in files (`grep -F`)
{% highlight bash linenos %}
grep -rl read_iter . | head -5 # Search recursively all the files that contain the string read_iter

grep -F ... *.c | head
{% endhighlight %}

# Other tools

## `cut`

{% highlight bash linenos %}
cd /etc/passwd
cut -d: -f 1 /etc/passwd | head -4 # Output the first field
{% endhighlight %}
## awk

{% highlight bash linenos %}
awk "/bash/" /etc/passwd # Output lines containing "bash"
awk -F: "$3 > 1000" /etc/passwd # Lines where field 3 > 1000
awk -F: "{print $1}" /etc/passw | head -5 # Output field 1
awk "!/^#/ {print $1}" /etc/services | head # Print first field that doesn't match the regular expression
{% endhighlight %}

### ack

ack - grep-like text finder

{% highlight bash linenos %}
ack --ruby foo # Find foo in occurrences in ruby files
ack abc -l # List files with the occurrence of abc character
{% endhighlight %}

# Processing

## Sorting

{% highlight bash linenos %}
sort -k 2 dates | head -5 # Sort by second and subsequent fields (space separated)
sort -k 4r dattes | head # Sorts in reverse order
sort -k 3M -k 2n dates | head  # sort 3rd field (Month) in chronological order, then second field (Month day) in numberical order

sort -t : -k 4n /etc/passwd | head # Sort by numeric group-id

sort -u /etc/passw | head # sort the unique elements
sort dates | sort -C && echo "Sorted"
{% endhighlight %}


The `comm` command allows to select or reject lines common to two files. Both files must be sorted.

{% highlight bash linenos %}
comm linux.bin freebsd.bin
{% endhighlight %}

# `sed`

## substitutions

Create JSON from list of items.

{% highlight bash linenos %}
vim tojson.sed

#!/bin/bash
li``
[ # Insert [ at the beginning
s/.*/ "&",/ # Convert lines into strings
$a\  # Append ] at the end
]
EOF

ls /usr | tojson.sed
{% endhighlight %}

# `awk`

Summarize size of of files in a directory.

{% highlight bash linenos %}
ll > contents.txt 
awk '                    
{ size += $5; n++ }  # Sum size and number of files
END {                # Print summary
print "Total size " size
print "Number of files " n
print "Average file size " size/n
}
' contents.txt
{% endhighlight %}

Count the number of file extension

{% highlight bash linenos %}
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
{% endhighlight %}

# `diff`

{% highlight bash linenos %}
diff -u a b
{% endhighlight %}

$ `patch`

{% highlight bash linenos %}
patch john.c <mary.patch # Patch John's copy with Mary's patch
{% endhighlight %}

# Testing and expressions

## `test`

{% highlight bash linenos %}
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
{% endhighlight %}

## `expr`

{% highlight bash linenos %}
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
{% endhighlight %}

{% highlight bash linenos %}
i=0
while [ $i -lt 10 ]; do
    echo $i
    i=$((i + 1))
done
{% endhighlight %}

# Dealing with characters

{% highlight bash linenos %}
echo 'This is a test' | tr ' ' - # Replace space with -
echo 'This is a test' | tr a-z A-Z # Replace a-z A-Z
{% endhighlight %}

## Encryption & Decription

{% highlight bash linenos %}
openssl enc -e -aes-256-cbc -pbkdf2 <pride-and-prejudice.txt >real-secret
freq real-secret
$ openssl enc -d -aes-256-cbc -pbkdf2 <real-secret | head
{% endhighlight %}

# Dealing with files

## `tac`

Print and concatenate files in reverse (last line first).

{% highlight bash linenos %}
ll | tac
{% endhighlight %}

## `rev`

{% highlight bash linenos %}
tail /usr/share/dict/words | rev # Reverse characters
{% endhighlight %}

## `paste`

{% highlight bash linenos %}
paste - /usr/share/dict/word
{% endhighlight %}

## `shuf`

{% highlight bash linenos %}
shuf -n 5 /usr/share/dict/words # Output five random words
shuf -n 1 -e heads tails # Throw a single coin
{% endhighlight %}
## split

{% highlight bash linenos %}
split -l 10000 -d /usr/share/dict/words # Split the dictionary
{% endhighlight %}

## `rs`

{% highlight bash linenos %}
head /etc/passwd | rs -c: -C: -T # Transposes the output
{% endhighlight %}


# Graphs

{% highlight bash linenos %}
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
{% endhighlight %}
Count nodes

{% highlight bash linenos %}

gvpr 'N {clone($0, $)}' talk.dot # Clone each node to the output graph
gvpr

{% endhighlight %}


# Images & sound

Create a symbolic link to a file or directory:

{% highlight bash linenos %}
tifftopnm image.tiff | pnmtopng >image.png # Convert from TIFF to PNG

for i in *.tiff ; do # For each TIFF file
> pngname=$(basename $i .tiff).png # Compute name of PNG file
> tifftopnm $i | # Convert image to PNM
> pnmtopng >$pngname # Convert and write to PNG file
> done

tifftopnm image.tiff | # Convert TIFF to PNM
> pamscale -width=1024 | # Scale to 1024 pixels
> pnmtopng >image.png # Write the result in PNG format

jpegtopnm plate.jpeg |
> pamflip -r90 | # Rotate the image by 90 degrees
> pamscale -width=1024 | # Scale to 1024 pixels
> pnmtojpeg >rplate.jpeg # Write the result in JPEG format
{% endhighlight %}

## sound

{% highlight bash linenos %}
play -q sox-orig.wav

sox sox-orig.wav sox-orig.mp3 # Convert between file formats
sox sox-orig.wav sox-low.wav pitch -600 # Lower pitch by 600 cents
play -q sox-low.wav

sox sox-orig.wav sox-fast.wav tempo 1.5 # Increase tempo by 50%
play -q sox-fast.wav

sox sox-orig.wav sox-chorus.wav chorus 0.5 0.9 50 0.4 0.25 2 -t \
60 0.32 0.4 2.3 -t 40 0.3 0.3 1.3 -s # Apply chorus effect
play -q sox-chorus.wav

wget -q -O persephone.mp3 \
http://ccmixter.org/content/hansatom/hansatom_-_Persephone.mp3 # By Hans Atom (CC BY 2.5)
sox persephone.mp3 persephone-trimmed.mp3 fade 0 0:06 1 # Trim to 6s with 1s fade-out
play -q persephone-trimmed.mp3

sox --combine mix -v 0.2 persephone-trimmed.mp3 sox-orig.wav \
sox-persephone.mp3 # Mix the two audio files
play -q sox-persephone.mp3
{% endhighlight %}


# Good practices


Output error

{% highlight bash linenos %}
echo Error >&2 # Send output to standard error
{% endhighlight %}
Clean up temporary files when script execution finishes

{% highlight bash linenos %}
cat >tmpdir.sh <<\EOF
#!/bin/sh
TMPDIR="${TMP:-/tmp}/$$" # Create temporary directory name
trap 'rm -rf "$TMPDIR"' 0 # Remove it when exiting
trap 'exit 2' 1 2 15 # Exit when the program is interrupted
mkdir "$TMPDIR" # Create the directory
# Do some work in $TMPDIR
EOF
{% endhighlight %}

Prefer redirection to pipes

{% highlight bash linenos %}
command <file # A redirection is all that's needed
{% endhighlight %}

Test command, not its exit code

{% highlight bash linenos %}
if ! command ; then # A simple negation will do
   echo Error >&2
fi
{% endhighlight %}

`grep` can recurse directories

{% highlight bash linenos %}
grep -r pattern . # Modern recursive search
{% endhighlight %}

Prefer wildcards to `ls`

{% highlight bash linenos %}
for i in * ; do # can be replaced by a wildcard
   . . .
done
{% endhighlight %}

Replace `awk` with `cut`

{% highlight bash linenos %}
cut -d : -f 1,7 # More efficient way to print fields 1 and 7
expr "$LANG" : '.*\.\(.*\)' # More efficient way to isolate encoding
UTF-8
{% endhighlight %}

Replace `sed` with `expr`

{% highlight bash linenos %}
echo $LANG
en_US.UTF-8
{% endhighlight %}

# References

- [Unix command specification](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/contents.html)
- [http://conqueringthecommandline.com](http://conqueringthecommandline.com)
- [The Missing Semester of Your CS Education](https://missing.csail.mit.edu/)
- [http://www.bashoneliners.com](http://www.bashoneliners.com)
- [https://www.commandlinefu.com](https://www.commandlinefu.com)
- [https://explainshell.com/](https://explainshell.com/)
