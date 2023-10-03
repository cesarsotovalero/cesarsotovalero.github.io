---
layout: post
title: Git Fundamentals
subtitle: The must-know git commands for software developers
description: The basic git commands that every developer should known.
tags: github
keywords: command line, version control, GitHub, software developement
image: ../img/posts/2017/git_logo_cover.png
share-img: ../img/posts/2017/git_logo_cover.png
show-avatar: false
toc: true
author: cesarsotovalero
date: 2017/11/14
published: true
---

Git is the standard version-control system for software development. Git was created by Linux Torvals in 2005 to support the development of the Linux kernel. Since then, Git has become an essential tool for both junior and senior developers. It allows to have a complete history and full version-tracking of the project, easing all the different phases of the development process.

<aside class="quote">
    <em>“Git proved I could be more than a one-hit wonder.” ― <cite>Linux Torvalds</cite></em> 
</aside>



# Git Configurations

First, add your user name and email to the git global configurations. These commands will be automatically written  to `~/.gitconfig`.

```bash
git config --global user.name "César Soto Valero"
git config --global user.email "cesarsotovalero@gmail. com"
```
To remove the return characters added by the OS every time that you commit a file:.

```bash
git config --global  core.autocrlf input
```
Lets make some useful aliases.  The first one allows us to retrieve a simplified status with `git s`, the second is an improved log with `git lg`.

```bash
git config --gloabal alias.s "status -s" 
git config --global alias.lg "log --oneline --all --graph --decorate"
```

# Git commits

To commit all the modified files,  add them to the staging area and commit with a message:

```bash
git add .
git commit -m "commit message goes here"
```

Optionally, can do both commands at the same time:

```bash
git commit -am "commit message goes here"
```

To change the message of the last t commit made:

```bash
git commit --amend
```

# Git branches

To list all the existing branches (including the remote branch, often called `origin/master`):

```bash
git branch -a
```

To create a new branch and move to it:

```bash
git checkout  -b branch_name
```

To switch to a branch:

```bash
git checkout branch_name
```

To remove a  branch:

```bash
git branch -d  branch_name
```

# Git diff

To see the difference between unstaged files:

```bash
git diff
```

To see the difference between staged files:

```bash
git diff --staged
```

To see the difference with respect to the last commit made:

```bash
git diff HEAD
```

# Git merge 

To merge a branch using recursive merge, switch to the desired branch (e.g., the `master` branch) and create a commit  message for the merge:

```bash
git merge --no-ff branch_name
```

To resolve a merge conflict, look at the status with `git s` and edit the file with the conflict with a text editor, then `add` and commit the files without a commit message to see additional details of the resolved conflict.

```bash
git add .
git commit
```

# Git rebase

To put all the commit of a branch on the top of the HEAD:

```bash
git checkout -b branch_name
git rebase master
```

To rebase interactively:

```bash
git rebase -i HEAD~5
```

Then edit the list of commits  by adding substituting  `pick` by `f` to squash the commits into less, or `r` to reword the commit message.

# Git fetch & push & pull

To push the content of your project to a remote repository (e.g., GitHub) create a repo and add it as a remote:

```bash
git remote add origin http://github.com/username/reponame.git
git push -u origin master
```

The fetch  command allows to retrieve the changes on the remote without merging to the master branch:

```bash
git  fetch
```

To fetch and merge the content of the remote repository at the same time:

```bash
git pull
```

# Git tags

Tags are useful to keep track of the releases. To add an annotated tag to a commit:

```bash
git tag -a v1.0.0 -m "tag message"
```

To show the information about the tag:

```bash
git show v1.0.0
```
 To push tags up to GitHub and add them as releases:
 
 ```bash
git push tags
```

# Git revert

To undo the last commit and create a new commit with the revert:

```bash
git revert commit_id
```

# Git reset

To throw away a certain number of commits (2 in this example) :

```bash
git reset HEAD~2
``` 

# Troubleshooting

**`.gitignore` is not working:** You may need to remove every file that was cached in the `.gitignore` file. Be aware to commit all your changes before, otherwise you will loose control on all the changed files. 

```bash
git rm -r --cached .
git add .
git commit -m ".gitignore is now working"
```

If what you want is to ignore a previously committed file:

```bash
git rm --cached <file_name>
git add .gitignore
git commit -m "update ignored files"
```

**Git log of a Java method:** You need to add the following to the `.gitattributes` file.

```bash
*.java diff=java
```
Then you can exectute the log command with the name of a method and the path to the file.

```bash
 git log -L :<methodName>:<javaFilePath>
```
 