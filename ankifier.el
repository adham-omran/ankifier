;;; ankifier.el --- Efficiently create Anki flashcards from your notes -*- lexical-binding: t; -*-

;; Copyright (C) 2022 Adham Omran

;; Author: Adham Omran <adham.rasoul@gmail.com>
;; Maintainer: Adham Omran <adham.rasoul@gmail.com>
;; Created: December 30, 2021
;; Version: 1.0.0
;; Homepage: https://github.com/adham-omran/ankifier
;; Package-Requires: ((emacs "27.2"))
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;  Efficiently create Anki flashcards from your notes

;;  This package extendsd anki-editor.el by Lei Tan, allowing notes written
;;  in a special format to be converted into Basic and Cloze questions

;;;; Installation

;;;;; Manual

;; Install these required packages:

;; (anki-editor)

;; Then put this file in your load-path, and put this in your init
;; file:

;; (require 'ankifier)

;;;; Usage

;; Run one of these commands:

;; `ankifier-create-basic-from-region': Create Basic question(s) from active region.
;; `ankifier-create-cloze-from-region': Create Cloze question(s) from active region.

;;;; Tips

;; + You can customize settings in the `ankifier' group.

;;;; Credits

;; This package would not have been possible without the following
;; packages: anki-editor[1], which allows the flash cards to be sent
;; to Anki in the first place.
;;
;;  [1] https://github.com/louietan/anki-editor

;;; Code:

;;;; Requirements

;;; (require 'anki-editor)

;;;; Customization

(defgroup ankifier nil
  "Settings for `ankifier'."
  :link '(url-link "https://github.com/adham-omran/ankifier")
  :group 'convenience)

(defcustom ankifier-anki-deck "All"
  "Anki deck to push to."
  :type '(string))

(defcustom ankifier-anki-cloze-note-type "Cloze"
  "Card type for cloze cards."
  :type '(string))

(defcustom ankifier-anki-basic-note-type "Basic"
  "Card type for basic cards."
  :type '(string))

(defcustom ankifier-anki-tags ""
  "Tags to be used for cards."
  :type '(string))

(defcustom ankifier-insert-elsewhere nil
  "If set to nil the templates insert in the same heading.
If set to t this will cause the templates to be inserted
into a special header whose name is determined by `ankifier-cards-heading'"
  :type '(boolean))

(defcustom ankifier-cards-heading "Cards"
  "Heading name in case `ankifier-insert-elsewhere' is set to t."
  :type '(string))

;;;; Variables

(defvar ankifier--cloze-region-results ()
  "Variable to store region capture results.")
(defvar ankifier--basic-region-results ()
  "Variable to store region capture results.")

;;;; Functions

;;;;; Public

(defun ankifier-create-basic-from-region ()
  "Create a set of questions from the selected region.
1. `ankifier--split-region-basic' creates the list of questions.
2. Check if `ankifier-insert-elsewhere' is t or nil.
If t, go to * `ankifier-cards-heading' or create it then go to it
else, create the basic question in-place."
  (interactive)
  (ankifier--split-region-basic)
  (if ankifier-insert-elsewhere
      (progn
        (save-excursion
          (save-restriction
            (widen)
            (ankifier--elsewhere-check)
            (ankifier--go-to-heading)
            (ankifier--create-basic-question))))
    (message "Inserting in place")
    (ankifier--create-basic-question)))

(defun ankifier-create-cloze-from-region ()
    "Create a set of clozes from the selected region.
1. `ankifier--split-region-cloze' creates the list of questions.
2. Check if `ankifier-insert-elsewhere' is t or nil.
If t, go to * `ankifier-cards-heading' or create it then go to it
else, create the cloze question in-place."
  (interactive)
  (ankifier--split-region-cloze)
  (if ankifier-insert-elsewhere
      (progn
        (ankifier--elsewhere-check)
        (ankifier--go-to-heading)
        (ankifier-insert-cloze))
    (message "Inserting in place")
    (ankifier-insert-cloze)))

;;;;; Private

(defun ankifier--split-region-basic ()
  "Split REGION into paragraphs seperated by \\n\\n."
  (let (
        (region-text (buffer-substring-no-properties (region-beginning) (region-end))))
    (setq ankifier--basic-region-results (split-string region-text "\n\n")))
  (deactivate-mark))

(defun ankifier--split-region-cloze ()
  "Split REGION into paragraphs seperated by \\n\\n.
The results are stored in `ankifier--cloze-region-results'"
  (let (
        (region-text (buffer-substring-no-properties (region-beginning) (region-end))))
    (setq ankifier--cloze-region-results (split-string region-text "\n\n")))
  (deactivate-mark))

(defun ankifier-insert-cloze ()
  "Split `ankifier--cloze-region-results' then insert card.
Splits the list of strings created by `ankifier--split-region-cloze' and
passes them to `ankifier--cloze-template' as parameters."
  (cl-loop for item in ankifier--cloze-region-results
           do
           (let (
                 (cloze item))
             (ankifier--cloze-template cloze))))

(defun ankifier--cloze-template (cloze)
  "Insert CLOZE into the anki-editor template."
  (org-insert-subheading nil)
  (insert "Cloze")
  ; Insert properties
  (insert "\n"
          ":PROPERTIES:\n"
          ":ANKI_DECK: " ankifier-anki-deck "\n"
          ":ANKI_NOTE_TYPE: " ankifier-anki-cloze-note-type "\n"
          ":ANKI_TAGS: " ankifier-anki-tags "\n"
          ":END:")
  (org-insert-subheading nil)
  (insert "Text")
  (insert "\n" cloze)
  (org-insert-heading nil)
  (insert "Back Extra")
  (outline-up-heading 2))

;;; Basic Card creation
(defun ankifier--create-basic-question ()
  "Split `ankifier--basic-region-results' then create card.
Splits the list of strings created by `ankifier--split-region-basic' and
passes them to `ankifier--basic-template' as parameters."
  (cl-loop for item in ankifier--basic-region-results
           do
           (let (
                 (question (car (split-string item "\?")))
                 (answer (cadr (split-string item "\?"))))
             (ankifier--basic-template question answer))))

(defun ankifier--basic-template (question answer)
  "Insert QUESTION and ANSWER into the anki-editor template."
  (org-insert-subheading nil)
  (insert "Basic")
  (insert "\n"
  ":PROPERTIES:\n"
  ":ANKI_DECK: " ankifier-anki-deck "\n"
  ":ANKI_NOTE_TYPE: " ankifier-anki-basic-note-type "\n"
  ":ANKI_TAGS: " ankifier-anki-tags "\n"
  ":END: ")
  (org-insert-subheading 1)
  (insert "Front")
  ;; Insert question
  (insert "\n" question "?")
  (org-insert-heading)
  (insert "Back")
  ;; Insert answer
  (insert "\n" answer)
  (outline-up-heading 2))

;;; Go to pre-named heading
(defun ankifier--go-to-heading ()
  "Go to `ankifier-cards-heading'."
  (goto-char (point-min))
  (search-forward (concat "* " ankifier-cards-heading) nil t))

(defun ankifier--elsewhere-check ()
  "Check if the heading * `ankifier-cards-heading' exists.
If it does not, it creates it on a top level."
  (unless (save-excursion
            (goto-char (point-min))
            (search-forward (concat "* " ankifier-cards-heading) nil t))
    ; Code that runs when no heading exists
    (ankifier--create-cards-heading)))

(defun ankifier--create-cards-heading ()
  "Create * `ankifier-cards-heading'."
  (save-excursion
    (org-insert-heading nil nil t)
    (insert ankifier-cards-heading)))

;;;; Footer

(provide 'ankifier)

;;; ankifier.el ends here
