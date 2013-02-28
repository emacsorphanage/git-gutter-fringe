# git-gutter-fringe.el

## Introduction
`git-gutter-fringe.el` is fringe version of of [git-gutter.el](https://github.com/syohex/emacs-git-gutter)


## Screenshot

![git-gutter-fringe.el](image/git-gutter-fringe.png)


## Requirements

* Emacs 24 or higher
* [git-gutter.el](https://github.com/syohex/emacs-git-gutter)
* [fringe-helper](http://www.emacswiki.org/emacs/FringeHelper) for using `git-gutter-fringe`


## Basic Usage

Interfaces are same as `git-gutter.el`.

* git-gutter
* git-gutter:clear
* git-gutter:toggle


## Sample Configuration

```` elisp
;; You need to install fringe-helper.el
(require 'git-gutter-fringe)
````

## Customize

### Look and feel

![git-gutter-fringe-customize](image/git-gutter-fringe-customize.png)

You can change faces like following.

````elisp
(set-face-foreground 'git-gutter-fr:modified "yellow")
(set-face-foreground 'git-gutter-fr:added    "blue")
(set-face-foreground 'git-gutter-fr:deleted  "white")
````

### Position of fringe

![git-gutter-fringe-right](image/git-gutter-fringe-right.png)

You can change position of fringe, left or right. Default is left.

````elisp
(setq git-gutter-fr:side 'right-fringe)
````
