---
layout: post
title: Git Fundamentals
subtitle: The Must-know Git Commands for Software Developers
published: true
description: The basic git commands that every developer should known. 
tags: tools
keywords: command line, version control, GitHub, software developement
image: https://cf.jare.io/?u=https://www.cesarsotovalero.net/img/git_logo.png
share-img: https://cf.jare.io/?u=https://www.cesarsotovalero.net/img/git_logo.png
show-avatar: false
author: cesarsotovalero
date: 2017/11/14
---

> "Git proved I could be more than a one-hit wonder" *― Linux Torvalds*

Git is the standard version-control system for software development. Git was created by Linux Torvals in 2005 to support the development of the Linux kernel. Since then, Git has become an essential tool for both junior and senior developers. It allows to have a complete history and full version-tracking of the project, easing all the different phases of the development process.

# Contents
   
* [Git configuratons](#git-configurations)
* [Git commits](#git-commits)
* [Git branches](#git-branches)
* [Git diff](#git-diff)
* [Git merge](#git-merge)
* [Git rebase](#git-rebase)
* [Git fetch &amp; push &amp; pull](#git-fetch--push--pull)
* [Git tags](#git-tags)
* [Git revert](#git-revert)
* [Git reset](#git-reset)
* [Troubleshooting](#troubleshooting)

# Git Configurations

First, add your user name and email to the git global configurations. These commands will be automatically written  to `~/.gitconfig`.

```git
git config --global user.name "César Soto Valero"
git config --global user.email "cesarsotovalero@gmail. com"
```
To remove the return characters added by the OS every time that you commit a file:.

```git
git config --global  core.autocrlf input
```
Lets make some useful aliases.  The first one allows us to retrieve a simplified status with `git s`, the second is an improved log with `git lg`.

```git
git config --gloabal alias.s "status -s" 
git config --global alias.lg "log --oneline --all --graph --decorate"
```

# Git commits

To commit all the modified files,  add them to the staging area and commit with a message:

```git
git add .
git commit -m "commit message goes here"
```

Optionally, can do both commands at the same time:

```git
git commit -am "commit message goes here"
```

To change the message of the last t commit made:

```git
git commit --amend
```

# Git branches

To list all the existing branches (including the remote branch, often called `origin/master`):

```git
git branch -a
```

To create a new branch and move to it:

```git
git checkout  -b branch_name
```

To switch to a branch:

```git
git checkout branch_name
```

To remove a  branch:

```git
git branch -d  branch_name
```

# Git diff

To see the difference between unstaged files:

```git
git diff
```

To see the difference between staged files:

```git
git diff --staged
```

To see the difference with respect to the last commit made:

```git
git diff HEAD
```

# Git merge 

To merge a branch using recursive merge, switch to the desired branch (e.g., the `master` branch) and create a commit  message for the merge:

```git
git merge --no-ff branch_name
```

To resolve a merge conflict, look at the status with `git s` and edit the file with the conflict with a text editor, then `add` and commit the files without a commit message to see additional details of the resolved conflict.

```git
git add .
git commit
```

# Git rebase

To put all the commit of a branch on the top of the HEAD:

```git
git checkout -b branch_name
git rebase master
```

To rebase interactively:

```git
git rebase -i HEAD~5
```

Then edit the list of commits  by adding substituting  `pick` by `f` to squash the commits into less, or `r` to reword the commit message.

# Git fetch & push & pull

To push the content of your project to a remote repository (e.g., GitHub) create a repo and add it as a remote:

```git
git remote add origin http://github.com/username/reponame.git
git push -u origin master
```

The fetch  command allows to retrieve the changes on the remote without merging to the master branch:

```git
git  fetch
```

To fetch and merge the content of the remote repository at the same time:

```git
git pull
```

# Git tags

Tags are useful to keep track of the releases. To add an annotated tag to a commit:

```git
git tag -a v1.0.0 -m "tag message"
```

To show the information about the tag:

```git
git show v1.0.0
```
 To push tags up to GitHub and add them as releases:
 
 ```git
git push tags
```

# Git revert

To undo the last commit and create a new commit with the revert:

```git
git revert commit_id
```

# Git reset

To throw away a certain number of commits (2 in this example) :

```git
git reset HEAD~2
``` 

# Troubleshooting

## Gitignore is not working. 


You may need to remove every file that was cached in the `.gitignore`. Be aware to commit all your changes before, otherwise you will loose control on all the changed files. 

```git
git rm -r --cached .
git add .
git commit -m ".gitignore is now working"
```

## git log of a Java method

You need to add the following to the `.gitattributes` file.

```text
*.java diff=java
```
Then you can exectute the log command with the name of a method and the path to the file.

```git
 git log -L :<methodName>:<javaFilePath>
```
 