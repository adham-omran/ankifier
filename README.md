
# Table of Contents

1.  [Screencast](#org3131ee2)
2.  [Installation](#org9f86f0b)
    1.  [Manual](#org71a0fba)
3.  [Usage](#org0115530)
    1.  [Examples](#orgcd9cc31)
    2.  [Tips](#org2bc7fdd)
4.  [Changelog](#org7133710)
    1.  [1.0.0](#orgd39b5d1)
5.  [Credits](#org017fcad)
6.  [Development](#org6169f4a)
7.  [License](#orgb77e085)

Efficiently create Anki flashcards from your notes.

I created this package to facilitate faster creation of Anki cards while I study
utilizing the fantastic text editing of Emacs.

I mostly use it inside [org-noter](https://github.com/weirdNox/org-noter).


<a id="org3131ee2"></a>

# Screencast

[Basic flashcard](screencasts/ankifier-basic.mp4)


<a id="org9f86f0b"></a>

# Installation


<a id="org71a0fba"></a>

## Manual

Install these packages:

-   `anki-editor`

    While not *required*, this is the package that allows the output of my package
    to be sent to Anki (utilizing the [AnkiConnect](https://ankiweb.net/shared/info/2055492159) addon).

Then put this file in your load-path, and put this in your init file:

    (require 'ankifier)


<a id="org0115530"></a>

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


<a id="orgcd9cc31"></a>

## Examples

What is Emacs?
An extensible, customizable, free/libre text editor — and more.

When was Emacs 27.2 released?
Mar 25, 2021.


<a id="org2bc7fdd"></a>

## Tips

-   You can customize settings in the `ankifier` group.
-   Check out [Power up Anki with Emacs, Org mode, anki-editor and more](https://yiufung.net/post/anki-org/) for ideas
    about general anki-editor use and how to get code highlighting working
    properly.


<a id="org7133710"></a>

# Changelog


<a id="orgd39b5d1"></a>

## 1.0.0

Initial release.


<a id="org017fcad"></a>

# Credits

-   This package would not have been possible without the following packages:
    [anki-editor](https://github.com/louietan/anki-editor), which allows the flash cards to be sent to Anki in the first place.


<a id="org6169f4a"></a>

# Development

Bug reports, feature requests, suggestions are all welcome, keep in mind this is
my first Emacs package!


<a id="orgb77e085"></a>

# License
GPL V3
Check [LICENSE](LICENSE)

