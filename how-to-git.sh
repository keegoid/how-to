#!/bin/bash

# safely rebase a team member's branch onto my own
git add .                      # stage all changes
git commit -m 'message'        # commit my changes
git fetch                      # get remote branches
git checkout team/working      # check out team working branch
git checkout -b tmp-branch     # make new tmp branch from tmp branch
git rebase my/working          # rebase new commits on top of my working branch
git checkout my/working        # checkout my working branch
git merge tmp-branch           # merge temporary branch into my working branch, which should put new commits on top without merge conflits

# safely rebase a feature
git checkout feature           # check out feature branch
git checkout -b tmp-branch     # make new tmp branch from feature branch
git rebase -i main             # rebase new commits on top of main, interactively if you want to clean up history
git checkout main              # checkout main
git merge tmp-branch           # merge temporary branch into main, which should put new commits on top without merge conflits

# rebase all commits from the start
git rebase -i --root

# rebase the last 9 commits
git rebase -i HEAD~9

# compare file with state 2 commits back
git diff HEAD~2 HEAD -- <file>

# list all tracked files in current directory
git ls-tree -r [branch-name] --name-only

# exclude everything but directory foo/bar
/*
!/foo
/foo/*
!/foo/bar

# stop tracking a file
git rm --cached [filename]

# undo failed merge
git reset --hard

# reset back 5 commits
git reset --hard HEAD~5

# how to split a subdirectory off into it's own repo
git filter-branch --prune-empty --tag-name-filter cat --subdirectory-filter Experts HEAD -- --all

# show reflogs for git
git log --oneline --decorate --walk-reflogs

# nice log view
git log --all --oneline --graph --decorate

# expire old reflogs
git reflog expire --expire=10.days --all

# prune old reflogs
git gc --prune=10.days

