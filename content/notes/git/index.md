---
title: "Git"
summary: "Tips 'n' tricks for git"
weight: 1
---

## Setup GIT using SSH in Windows

- Setup GIT_SSH env to point to plink

  ```powershell
  $env:GIT_SSH="path/to/plink.exe"
  ```

- Add key in pagent
- Test connection to github

  ```powershell
  plink.exe -v git@github.com
  ```

## Working with remote

To see the current remote links

```git
git remote -v
```

To set the remote link for origin

```git
git remote set-url origin path/to/remote.git
```

## Diff between first commit and current commit of current branch (not master)

```git
git diff "$((git log master.. --reverse --pretty=%h)[0]).."
```

Code inside parentheses grabs the id of the first commit of the current branch that is in current branch and not **master**. It is then inserted in the string and passed to **diffall** as the range between it and the current commit.
