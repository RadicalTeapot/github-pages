---
title: "Spacemacs"
weight: 1
---

## Fresh install

- Set `HOME` to desired folder

  ```powershell
    cd <path-to-folder>
    $env:HOME = (pwd)
  ```

- Clone spacemacs and checkout develop branch

  ```powershell
    git clone https://github.com/syl20bnr/spacemacs .emacs.d
    cd .emacs.d
    git checkout develop
  ```

- Clone personal repo in there

 ```powershell
  git clone https://github.com/RadicalTeapot/spacemacs-config.git .spacemacs.d
 ```

- Start emacs from terminal where `HOME` has been set

- Check that `HOME` in `.spacemacs.d/.spacemacs.env` is set to the correct path

- (Optional) Create a `ps1` script to start spacemacs

```powershell
  $env:HOME = <path-to-home-folder>;
  Start-Process -NewWindow Hidden emacs.exe;
 ```

## Org

### Fix bug with refile

[Source](https://github.com/syl20bnr/spacemacs/issues/11788)

- Delete all ~.elc~ files (close all instances of spacemacs first)

  ```powershell
    cd ~/.emacs.d
    gci -Filter "*.elc" -Recurse | %{ri $_.FullName -Force}
  ```

- Recompile by running (in spacemacs)
  **SPC f e c** (`spacemacs/recompile-elpa`)

- Refile away (**, s r**)

### Refile

Add those to `config/post-init-org` (config layer `packages.el`)

```emacs-lisp
org-refile-targets '(
                     (org-agenda-files :maxlevel . 9)
                     (nil :maxlevel . 9))
org-outline-path-complete-in-steps nil
org-refile-use-outline-path t
```

### How to make ispell work with Windows

- Grab hunspell from here <https://sourceforge.net/projects/ezwinports/files/?source=navbar> (or <https://github.com/iquiw/hunspell-binary> but it doesn't seem to work)
- Unzip it
- Add :variables ispell-program-name "C:/Users/MathiasCapdet/AppData/Local/_software/Hunspell/1.3.2/bin/hunspell.exe" spell-checking layer in config/layers.el

### ox-hugo

Activate when loading org  -> (org :variable org-enable-hugo-export t)
Subtrees need some entries in properties drawers to be valid and exported (see example file and doc at <https://ox-hugo.scripter.co/doc/hugo-section/>
