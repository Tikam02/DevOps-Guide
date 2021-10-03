# Files and Directories



- [pwd]()
- [cd]()
- [clear]()
- [ls]()
- [mkdir]()
- [touch]()
- [rm]()
- [cp]()
- [mv]()
- [rename]()
- [ln]()
- [tar and gzip]()

***********************




## cd

> Change the shell working directory

## pwd

```bash
$ pwd
/home/learnbyexample

$ # providing an absolute path as argument
$ cd /etc
$ pwd
/etc

$ # to go back to previous working directory
$ # if there's a directory named '-', use './-' to go that directory
$ cd -
/home/learnbyexample
$ pwd
/home/learnbyexample

    Relative paths are well, relative to current working directory
    . refers to current directory
    .. refers to directory one hierarchy above
    ../.. refers to directory two hierarchies above and so on

$ pwd
/home/learnbyexample

$ # go to directory one hierarchy above
$ cd ..
$ pwd
/home

$ # go to directory 'learnbyexample' present in current directory
$ # './' is optional in this case
$ cd ./learnbyexample
$ pwd
/home/learnbyexample

$ # go to directory two hierarchies above
$ cd ../..
$ pwd
/
```

> cd ~/ or cd ~ or cd will go to directory specified by HOME shell variable (which is usually set to user's home directory)

```bash
$ pwd
/
$ echo "$HOME"
/home/learnbyexample

$ cd
$ pwd
/home/learnbyexample

```

## clear

> clear the terminal screen



## ls

> list directory contents



## mkdir

> make directories

```bash
$ # one or more absolute/relative paths can be given to create directories
$ mkdir reports 'low power adders'

$ # listing can be confusing when filename contains characters like space
$ ls
low power adders  reports
$ ls -1
low power adders
reports

    use -p option to create multiple directory hierarchies in one go
    it is also useful in scripts to create a directory without having to check if it already exists
    special variable $? gives exit status of last executed command
        0 indicates success and other values indicate some kind of failure
        see documentation of respective commands for details

$ mkdir reports
mkdir: cannot create directory ‘reports’: File exists
$ echo $?
1
$ # when -p is used, mkdir won't give an error if directory already exists
$ mkdir -p reports
$ echo $?
0

$ # error because 'a/b' doesn't exist
$ mkdir a/b/c
mkdir: cannot create directory ‘a/b/c’: No such file or directory
$ # with -p, any non-existing directory will be created as well
$ mkdir -p a/b/c
$ ls -1R a
a:
b

a/b:
c

a/b/c:

```

## Further Reading

- [mkdir Q&A on unix stackexchange](https://unix.stackexchange.com/questions/tagged/mkdir?sort=votes&pageSize=15)
- [mkdir Q&A on stackoverflow](https://unix.stackexchange.com/questions/tagged/mkdir?sort=votes&pageSize=15)
- [unix.stackexchange: Characters best avoided in filenames](https://unix.stackexchange.com/questions/269093/characters-best-avoided-in-filenames-when-used-in-bash-e-g)




## touch

> Usually files are created using a text editor or by redirecting output of a command to a file.But sometimes, for example to test file renaming, creating empty files comes in handy the touch command is primarily used to change timestamp of a file.

```bash
$ touch test.txt
$ ls -1F
a/
test.txt
low power adders/
reports/
```

## rm

> remove files and directories

```bash

$ ls
a  ip.txt  low power adders  reports
$ rm ip.txt
$ ls
a  low power adders  reports

$ rm reports
rm: cannot remove 'reports': Is a directory
$ rm -r reports
$ ls
a  low power adders

$ # to remove only empty directory, same as 'rmdir' command
$ rm -d a
rm: cannot remove 'a': Directory not empty

    typos like misplaced space, wrong glob, etc could wipe out files not intended for deletion
    apart from having backups and snapshots, one could take some mitigating steps
        using -i option to interactively delete each file
        using echo as a dry run to see how the glob expands
        using a trash command (see links below) instead of rm

$ rm -ri 'low power adders'
rm: remove directory 'low power adders'? n
$ ls
a  low power adders

$ rm -ri a
rm: descend into directory 'a'? y
rm: descend into directory 'a/b'? y
rm: remove directory 'a/b/c'? y
rm: remove directory 'a/b'? y
rm: remove directory 'a'? y
$ ls
low power adders

```

## cp

> copy files and directories


```bash
$ # when destination is a directory, specified sources are placed inside that directory
$ # recall that . is a relative path referring to current directory
$ cp /usr/share/dict/words .
$ ls
low power adders  words

$ cp /usr/share/dict .
cp: omitting directory '/usr/share/dict'
$ cp -r /usr/share/dict .
$ ls -1F
dict/
low power adders/
words

often, we want to copy for the purpose of modifying it in such cases, a different name can be given while specifying the destination if the destination filename already exists, it will be overwritten (see options -i and -n to avoid this)

$ cp /usr/share/dict/words words_ref.txt
$ cp -r /usr/share/dict word_lists

$ ls -1F
dict/
low power adders/
word_lists/
words
words_ref.txt

multiple files and directories can be copied at once if the destination is a directoryusing -t option, one could specify destination directory first followed by sources (this is helpful with find command and other places)

$ mkdir bkp_dot_files

$ # here, ~ will get expanded to user's home directory
$ cp ~/.bashrc ~/.bash_profile bkp_dot_files/
$ ls -A bkp_dot_files
.bash_profile  .bashrc\
```

- see man cp and info cp for more options and complete documentation
- some notable options are
     - -u copy files from source only if they are newer than those in destination or if it doesn't exist in destination location
     - -b and --backup for back up options if file with same name already exists in destination location
     - --preserve option to copy files along with source file attributes like timestamp

## Further Reading

- [cp Q&A on unix stackexchange](https://unix.stackexchange.com/questions/tagged/cp?sort=votes&pageSize=15)
- [cp Q&A on stackoverflow](https://stackoverflow.com/questions/tagged/cp?sort=votes&pageSize=15)


## mv

> move (rename) files

```bash
$ ls
bkp_dot_files  dict  low power adders  word_lists  words  words_ref.txt
$ mkdir backups

$ mv bkp_dot_files/ backups/
$ ls -F
backups/  dict/  low power adders/  word_lists/  words  words_ref.txt
$ ls -F backups/
bkp_dot_files/

$ mv dict words backups/
$ ls -F
backups/  low power adders/  word_lists/  words_ref.txt
$ ls -F backups/
bkp_dot_files/  dict/  words

    like cp command, for single file/directory one can provide a different destination name
    so, when source and destination has same parent directory, mv acts as renaming command

$ mv backups/bkp_dot_files backups/dot_files
$ ls -F backups/
dict/  dot_files/  words
```

## Further Reading

- [mv Q&A on unix stackexchange](https://unix.stackexchange.com/questions/tagged/mv?sort=votes&pageSize=15)
- [mv Q&A on stackoverflow](https://stackoverflow.com/questions/tagged/mv?sort=votes&pageSize=15)


## rename

> renames multiple files



```bash
$ ls
backups  low power adders  word_lists  words_ref.txt
$ # here, the * glob will expand to all non-hidden files in current directory
$ # -n option is for dry run, to see changes before actually renaming files
$ # s/ /_/g means replace all space characters with _ character
$ rename -n 's/ /_/g' *
rename(low power adders, low_power_adders)

$ rename 's/ /_/g' *
$ ls
backups  low_power_adders  word_lists  words_ref.txt

```

## Further Reading

- [rename Q&A on unix stackexchange](https://unix.stackexchange.com/questions/tagged/rename?sort=votes&pageSize=15)
- [See Perl one liners for examples and details on Perl substitution command](https://github.com/learnbyexample/Command-line-text-processing/blob/master/perl_the_swiss_knife.md)
- [Some more rename examples - unix.stackexchange: replace dots except last one and stackoverflow: change date format](https://unix.stackexchange.com/questions/315586/replacing-dots-in-file-name-with-underscores-except-the-extension/315589#315589)


## ln

> make links between files

> there are two types of links - symbolic and hard links symbolic links is like a pointer/shortcut to another file or directory if the original file is deleted or moved to another location, symbolic link will no longer work if the symbolic link is moved to another location, it will still work if the link was done using absolute path (for relative path, it will depend on whether or not there's another file with same name in that location)a symbolic link file has its own inode, permissions, timestamps, etc most commands will work the same when original file or the symbolic file is given as command line argument, see their documentation for details

```bash
$ # similar to cp, a different name can be specified if needed
$ ln -s /usr/share/dict/words .
$ ls -F
words@

$ # to know which file the link points to
$ ls -l words
lrwxrwxrwx 1 learnbyexample eg 21 Jul  9 13:41 words -> /usr/share/dict/words
$ readlink words
/usr/share/dict/words
$ # the linked file may be another link
$ # use -f option to get original file
$ readlink -f words
/usr/share/dict/english
```

> hard link can only point to another file (not a directory, and restricted to within the same filesystem) the . and .. special directories are the exceptions, they are hard links which are automatically created once a hard link is created, there is no distinction between the two files other than different filename/location - they have same inode, permissions, timestamps, etc any of the hard link will continue working even if all the other hard links are deleted if a hard link is moved to another location, the links will still be in sync - any change in one of them will be reflected in all the other links

```bash
$ touch foo.txt
$ ln foo.txt baz.txt

$ # the -i option gives inode
$ ls -1i foo.txt baz.txt
649140 baz.txt
649140 foo.txt
```

## Further Reading

- unlink command to delete links (rm can be used as well)
- [ln Q&A on unix stackexchange](https://unix.stackexchange.com/questions/tagged/ln?sort=votes&pageSize=15)
- [ln Q&A on stackoverflow](https://stackoverflow.com/questions/tagged/ln?sort=votes&pageSize=15)
- [askubuntu: What is the difference between a hard link and a symbolic link?](https://askubuntu.com/questions/108771/what-is-the-difference-between-a-hard-link-and-a-symbolic-link)
      - [unix.stackexchange: What is the difference between symbolic and hard links?](https://unix.stackexchange.com/questions/9575/what-is-the-difference-between-symbolic-and-hard-links)
      - [unix.stackexchange: What is a Superblock, Inode, Dentry and a File?](https://unix.stackexchange.com/questions/4402/what-is-a-superblock-inode-dentry-and-a-file)


## tar and gzip

> tar is an archiving utility first, lets see an example of creating single archive file from multiple input files note that the archive file so created is a new file and doesn't overwrite input files


```bash
$ ls -F
backups/  low_power_adders/  word_lists/  words_ref.txt

$ # -c option creates a new archive, existing archive will be overwritten
$ # -f option allows to specify name of archive to be created
$ # rest of the arguments are the files to be archived
$ tar -cf bkp_words.tar word_lists words_ref.txt

$ ls -F
backups/  bkp_words.tar  low_power_adders/  word_lists/  words_ref.txt
$ ls -sh bkp_words.tar
2.3M bkp_words.tar

    once we have an archive, we can compress it using gzip
    this will replace the archive file with compressed version, adding a .gz suffix

$ gzip bkp_words.tar

$ ls -F
backups/  bkp_words.tar.gz  low_power_adders/  word_lists/  words_ref.txt
$ ls -sh bkp_words.tar.gz
652K bkp_words.tar.gz

    to uncompress, use gunzip or gzip -d
    this will replace the compressed version with the uncompressed archive file

$ gunzip bkp_words.tar.gz

$ ls -F
backups/  bkp_words.tar  low_power_adders/  word_lists/  words_ref.txt
$ ls -sh bkp_words.tar
2.3M bkp_words.tar

    to extract the original files from archive, use -x option

$ mkdir test_extract
$ mv bkp_words.tar test_extract/
$ cd test_extract/
$ ls
bkp_words.tar

$ tar -xf bkp_words.tar
$ ls -F
bkp_words.tar  word_lists/  words_ref.txt
$ cd ..
$ rm -r test_extract/

- the GNU version of tar supports compressing/uncompressing options as well

$ ls -F
backups/  low_power_adders/  word_lists/  words_ref.txt

$ # -z option gives same compression as gzip command
$ # reverse would be: tar -zxf bkp_words.tar.gz
$ tar -zcf bkp_words.tar.gz word_lists words_ref.txt
$ ls -sh bkp_words.tar.gz
652K bkp_words.tar.gz
```
- there are loads of options for various needs, see documentation for details
    - -v for verbose option
    - -r to append files to archive
    - -t to list contents of archive
    - --exclude= to specify files to be ignored from archiving
    - -j and -J to use bzip2 or xz compression technique instead of -z which uses gzip
- there are commands starting with z to work with compressed files
    - zcat to display file contents of compressed file on standard output
    - zless to display file contents of compressed file one screenful at a time
    - zgrep to search compressed files and so on...


## Further Reading

- [tar Q&A on unix stackexchange](https://unix.stackexchange.com/questions/tagged/tar?sort=votes&pageSize=15)
- [tar Q&A on stackoverflow](https://stackoverflow.com/questions/tagged/tar?sort=votes&pageSize=15)
- [superuser: gzip without tar? Why are they used together?](https://superuser.com/questions/252065/gzip-without-tar-why-are-they-used-together)
