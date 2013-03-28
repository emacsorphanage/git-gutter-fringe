# git-gutter-fringe.el

## Introduction
`git-gutter-fringe.el` is fringe version of of [git-gutter.el](https://github.com/syohex/emacs-git-gutter).


`git-gutter.el` does not work with `linum-mode` but `git-gutter-fringe.el` can work with `linum-mode`.
In contrast, `git-gutter-fringe.el` does not work in tty frame(`emacs -nw`), but `git-gutter.el`
can work in tty frame.


## Screenshot

![git-gutter-fringe.el](image/git-gutter-fringe.png)


## Requirements

* Emacs 23 or higher
* [git-gutter.el](https://github.com/syohex/emacs-git-gutter)
* [fringe-helper](http://www.emacswiki.org/emacs/FringeHelper) for using `git-gutter-fringe`


## Installation

You can install `git-gutter.el` from [MELPA](https://github.com/milkypostman/melpa.git) with package.el
(`M-x package-install git-gutter-fringe`).

And you can also install it with [el-get](https://github.com/dimitri/el-get).


## Basic Usage

Interfaces are same as `git-gutter.el`.

* git-gutter
* git-gutter:clear
* git-gutter:toggle


## Sample Configuration

```elisp
;; You need to install fringe-helper.el
(require 'git-gutter-fringe)
```

## Customize

### Look and feel

![git-gutter-fringe-customize](image/git-gutter-fringe-customize.png)

You can change faces like following.

```elisp
(set-face-foreground 'git-gutter-fr:modified "yellow")
(set-face-foreground 'git-gutter-fr:added    "blue")
(set-face-foreground 'git-gutter-fr:deleted  "white")
```

### Change signs in fringe

![git-gutter-fringe-change-signs](image/git-gutter-fringe-change-signs.png)

```elisp
;; Please adjust fringe width if your own sign is too big.
(setq-default left-fringe-width  20)
(setq-default right-fringe-width 20)

(fringe-helper-define 'git-gutter-fr:added nil
  ".XXXXXX."
  "XX....XX"
  "X......X"
  "X......X"
  "XXXXXXXX"
  "XXXXXXXX"
  "X......X"
  "X......X")

(fringe-helper-define 'git-gutter-fr:deleted nil
  "XXXXXX.."
  "XX....X."
  "XX.....X"
  "XX.....X"
  "XX.....X"
  "XX.....X"
  "XX....X."
  "XXXXXX..")

(fringe-helper-define 'git-gutter-fr:modified nil
  "XXXXXXXX"
  "X..XX..X"
  "X..XX..X"
  "X..XX..X"
  "X..XX..X"
  "X..XX..X"
  "X..XX..X"
  "X..XX..X")
```

### Position of fringe

![git-gutter-fringe-right](image/git-gutter-fringe-right.png)

You can change position of fringe, left or right. Default is left.

```elisp
(setq git-gutter-fr:side 'right-fringe)
```
