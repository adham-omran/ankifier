
# Table of Contents

1.  [Screencast](#orga1d55a7)
2.  [Installation](#org65c0c62)
    1.  [Manual](#org05c8542)
3.  [Usage](#org7b565c2)
    1.  [Examples](#org1a8b50f)
    2.  [Tips](#org8509162)
4.  [Changelog](#org845f948)
    1.  [1.0.0](#orga63e8eb)
5.  [Credits](#orgbcd4042)
6.  [Development](#org4c1de30)
7.  [License](#org55456dd)

This is my package.  It is nice.  You should try it.


<a id="orga1d55a7"></a>

# Screencast

[anki-basic.mp4](screencasts/ankifier-basic.mp4)


<a id="org65c0c62"></a>

# Installation


<a id="org05c8542"></a>

## Manual

Install these required packages:

-   `anki-editor`

Then put this file in your load-path, and put this in your init file:

    (require 'ankifier)


<a id="org7b565c2"></a>

# Usage

Run one of these commands on an active region:

-   `ankifier-create-basic-from-region`: Create Basic question(s) from active
    region.
-   `ankifier-create-cloze-from-region`: Create Cloze question(s) from active
    region.
-   Set `ankifier-insert-elsewhere` to `t` if you want the questions to be created
    under a `* Cards` org heading (This is what I mostly do).
    The name of the heading can be edited using `ankifier-cards-heading`.

Note that for a **basic** question, the questions must be separated by two newlines
and have a single question mark to indicate the *Question* part and the *Answer*
part.


<a id="org1a8b50f"></a>

## Examples

What is Emacs?
An extensible, customizable, free/libre text editor — and more.

When was Emacs 27.2 released?
Mar 25, 2021


<a id="org8509162"></a>

## Tips

-   You can customize settings in the `ankifier` group.
-   Check out [Power up Anki with Emacs, Org mode, anki-editor and more](https://yiufung.net/post/anki-org/) for ideas
    about general anki-editor use and how to get code highlighting working
    properly.


<a id="org845f948"></a>

# Changelog


<a id="orga63e8eb"></a>

## 1.0.0

Initial release.


<a id="orgbcd4042"></a>

# Credits

-   This package would not have been possible without the following packages:
    [anki-editor](https://github.com/louietan/anki-editor), which allows the flash cards to be sent to Anki in the first place.


<a id="org4c1de30"></a>

# Development

Bug reports, feature requests, suggestions are all welcome, keep in mind this is
my first Emacs package!


<a id="org55456dd"></a>

# License

GPLv3

