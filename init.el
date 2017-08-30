;;; init.el --- This is a basic emacs configuration aimed at social scientists using R/latex/markdown/git

;;; Commentary:
;; init.el is the first file that Emacs reads when it starts up. We
;; don't do much here, but we do tell it to load another file
;; "init-emacs.org", which is where we do most of our configuration.

;; A description on how to use this file and the corresponding org
;; file is given in the README document, which you should have
;; received along with this file. If not, you may find it on github:
;; https://github.com/jabranham/emacs-for-social-science


;;; Code:

(if (version< emacs-version "24.5.1"); Minimum version is emacs 24.5.1
    (error "Your Emacs is too old -- this config requires v%s or higher"))

;; package.el customization - here we set up how Emacs handles packages!
(require 'package)
(setq package-enable-at-startup nil)

;; Windows has issues using https:// instead of http:// so we want to
;; set the package locations to use the secure connection when they
;; can:
(cond
 ((string-equal system-type "windows-nt") ; Microsoft Windows
  (progn
    (setq package-archives
          '(("melpa" . "http://melpa.org/packages/")
            ("elpa" . "http://elpa.gnu.org/packages/")))))
 ((or (string-equal system-type "gnu/linux") ; Linux
      (string-equal system-type "darwin")) ; & Mac OS X
  (progn
    (setq package-archives
          '(("melpa" . "https://melpa.org/packages/")
            ("elpa" . "https://elpa.gnu.org/packages/"))))))
(package-initialize)

;; Load the init-emacs.org file:
(org-babel-load-file (concat user-emacs-directory "init-emacs.org"))

;;; init.el ends here
