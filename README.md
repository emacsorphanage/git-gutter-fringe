# git-gutter-fringe.el

[![melpa badge][melpa-badge]][melpa-link]
[![melpa stable badge][melpa-stable-badge]][melpa-stable-link]
[![gh actions badge][gh-actions-badge]][gh-actions-link]

## Introduction
`git-gutter-fringe.el` is fringe version of of [git-gutter.el](https://github.com/syohex/emacs-git-gutter).


`git-gutter.el` does not work with `linum-mode` but `git-gutter-fringe.el` can work with `linum-mode`.
In contrast, `git-gutter-fringe.el` does not work in tty frame(`emacs -nw`), but `git-gutter.el`
can work in tty frame.

**NOTE: You can not use both git-gutter.el and git-gutter-fringe.el**

## Screenshot

![Screenshot of git-gutter-fringe.el](image/git-gutter-fringe.png)


## Requirements

* Emacs 24 or higher
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

```lisp
;; You need to install fringe-helper.el
(require 'git-gutter-fringe)
```

## Customize

### Look and feel

![git-gutter-fringe-customize](image/git-gutter-fringe-customize.png)

You can change faces like following.

```lisp
(set-face-foreground 'git-gutter-fr:modified "yellow")
(set-face-foreground 'git-gutter-fr:added    "blue")
(set-face-foreground 'git-gutter-fr:deleted  "white")
```

### Change signs in fringe

![git-gutter-fringe-change-signs](image/git-gutter-fringe-change-signs.png)

```lisp
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

```lisp
(setq git-gutter-fr:side 'right-fringe)
```

## Comparison with diff-hl

I suppose if you enable vc-mode, you should use diff-hl rather than git-gutter-fringe.
I always use git-gutter.el(and I love git-gutter.el), however I don't use git-gutter-fringe
and don't do dog-fooding myself.

#### diff-hl is based on Emacs VC. git-gutter-fringe does not use vc.

You can use git-gutter-fringe even if you disable vc-mode.
While diff-hl benefits from VC. For example, if vc supports new VCS which is greater than git,
diff-hl works with such VCS with no code modification. However git-gutter.el does not
benefit from vc-mode, I need to add code for supporting such new great VCS.


#### See also

- [diff-hl](https://github.com/dgutov/diff-hl)
- [git-gutter](https://github.com/syohex/emacs-git-gutter/)

[melpa-link]: https://melpa.org/#/git-gutter-fringe
[melpa-stable-link]: https://stable.melpa.org/#/git-gutter-fringe
[gh-actions-link]: https://github.com/emacsorphanage/git-gutter-fringe/actions
[melpa-badge]: https://melpa.org/packages/git-gutter-fringe-badge.svg
[melpa-stable-badge]: https://stable.melpa.org/packages/git-gutter-fringe-badge.svg
[gh-actions-badge]: https://github.com/emacsorphanage/git-gutter-fringe/workflows/ci-checks/badge.svg
