(unless (>= emacs-major-version 24)
  (error "The aaron-theme requires Emacs 24 or later!"))

(setq visible-bell t)

(deftheme aaron "The aaron color theme")

;; Monokai colors
(defcustom aaron-theme-yellow "#E6DB74" "Primary colors - yellow" :type 'string :group 'monokai)
(defcustom aaron-theme-orange "#FD971F" "Primary colors - orange" :type 'string :group 'monokai)
(defcustom aaron-theme-red "#F92672" "Primary colors - red" :type 'string :group 'monokai)
(defcustom aaron-theme-magenta "#FD5FF0" "Primary colors - magenta" :type 'string :group 'monokai)
(defcustom aaron-theme-blue "#66D9EF" "Primary colors - blue" :type 'string :group 'monokai)
(defcustom aaron-theme-green "#A6E22E" "Primary colors - green" :type 'string :group 'monokai)
(defcustom aaron-theme-cyan "#A1EFE4" "Primary colors - cyan" :type 'string :group 'monokai)
(defcustom aaron-theme-violet "#AE81FF" "Primary colors - violet" :type 'string :group 'monokai)

(let ((background "#062329")
      (gutters    "#062329")
      (gutter-fg  "#062329")
      (gutters-active "#062329")
      (builtin      "#ffffff")
      (selection  "#0000ff")
      (text       "#d1b897")
      (comments   "#44b340")
      (punctuation "#8cde94")
      (keywords "#ffffff")
      (variables "#c1d1e3")
      (functions "#ffffff")
      (methods    "#c1d1e3")
      (strings    "#2ec09c")
      (constants "#7ad0c6")
      (macros "#8cde94")
      (numbers "#7ad0c6")
      (white     "#ffffff")
      (error "#ff0000")
      (warning "#ffaa00")
      (highlight-line "#0b3335")
      (line-fg "#126367"))

  (custom-theme-set-faces
   'aaron

   ;; Default colors
   ;; *****************************************************************************

   `(default                          ((t (:foreground ,text :background ,background, :weight normal))))
   `(region                           ((t (:foreground nil :background ,selection))))
   `(cursor                           ((t (:background ,white                        ))))
   `(fringe                           ((t (:background ,background   :foreground ,white))))
   `(linum                            ((t (:background ,background :foreground ,gutter-fg))))
   `(highlight ((t (:foreground nil :background ,selection))))

   ;; Font specification
   ;; *****************************************************************************
   (when (member "Consolas" (font-family-list))
     (set-frame-font "Consolas-11" t t))

   ;; Font lock faces
   ;; *****************************************************************************

   `(font-lock-keyword-face           ((t (:foreground ,keywords))))
   `(font-lock-type-face              ((t (:foreground ,punctuation))))
   `(font-lock-constant-face          ((t (:foreground ,constants))))
   `(font-lock-variable-name-face     ((t (:foreground ,variables))))
   `(font-lock-builtin-face           ((t (:foreground ,builtin))))
   `(font-lock-string-face            ((t (:foreground ,strings))))
   `(font-lock-comment-face           ((t (:foreground ,comments))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,comments))))
   `(font-lock-doc-face               ((t (:foreground ,comments))))
   `(font-lock-function-name-face     ((t (:foreground ,functions))))
   `(font-lock-doc-string-face        ((t (:foreground ,strings))))
   `(font-lock-preprocessor-face      ((t (:foreground ,macros))))
   `(font-lock-warning-face           ((t (:foreground ,warning))))

   ;; Plugins
   ;; *****************************************************************************
   `(trailing-whitespace ((t (:foreground nil :background ,warning))))
   `(whitespace-trailing ((t (:background nil :foreground ,warning :inverse-video t))))

   `(linum ((t (:foreground ,line-fg :background ,background))))
   `(linum-relative-current-face ((t (:foreground ,white :background ,background))))
   `(line-number ((t (:foreground ,line-fg :background ,background))))
   `(line-number-current-line ((t (:foreground ,white :background ,background))))

   ;; hl-line-mode
   `(hl-line ((t (:background ,highlight-line))))
   `(hl-line-face ((t (:background ,highlight-line))))

   ;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,aaron-theme-violet))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,aaron-theme-blue))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,aaron-theme-green))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,aaron-theme-yellow))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,aaron-theme-orange))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,aaron-theme-red))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,aaron-theme-violet))))
   `(rainbow-delimiters-depth-8-face ((t (:foreground ,aaron-theme-blue))))
   `(rainbow-delimiters-depth-9-face ((t (:foreground ,aaron-theme-green))))
   `(rainbow-delimiters-depth-10-face ((t (:foreground ,aaron-theme-yellow))))
   `(rainbow-delimiters-depth-11-face ((t (:foreground ,aaron-theme-orange))))
   `(rainbow-delimiters-depth-12-face ((t (:foreground ,aaron-theme-red))))

   ;; mode-line and powerline
   `(mode-line-buffer-id ((t (:foreground ,background :distant-foreground ,text :text ,text :weight bold))))
   `(mode-line ((t (:inverse-video unspecified
                                   :underline unspecified
                                   :foreground ,background
                                   :background ,text
                                   :box nil))))
   `(powerline-active1 ((t (:background ,text :foreground ,background))))
   `(powerline-active2 ((t (:background ,text :foreground ,background))))

   `(mode-line-inactive ((t (:inverse-video unspecified
                                            :underline unspecified
                                            :foreground ,text
                                            :background ,background
                                            :box nil))))
   `(powerline-inactive1 ((t (:background ,background :foreground ,text))))
   `(powerline-inactive2 ((t (:background ,background :foreground ,text))))

   ;; highlight numbers
   `(highlight-numbers-number ((t (:foreground ,numbers))))
  )

  (custom-theme-set-variables
    'aaron
    '(linum-format " %5i "))
)

;;Highlighting comment TAGs
 (setq fixme-modes '(c++-mode c-mode emacs-lisp-mode))
 (make-face 'font-lock-fixme-face)
 (make-face 'font-lock-note-face)
 (make-face 'font-lock-bug-face)
 (mapc (lambda (mode)
	 (font-lock-add-keywords
	  mode
	  '(("\\<\\(TODO\\)" 1 'font-lock-fixme-face t)
            ("\\<\\(NOTE\\)" 1 'font-lock-note-face t)
	    ("\\<\\(BUG\\)" 1 'font-lock-bug-face t))))
	fixme-modes)
 (modify-face 'font-lock-fixme-face "Red" nil nil t nil t nil nil)
 (modify-face 'font-lock-note-face "Dark Green" nil nil t nil t nil nil)
 (modify-face 'font-lock-bug-face "Orange" nil nil t nil t nil nil)

;;JAVASCRIPT configuration
(setq js-indent-level 2)

;;C Programming Language
(setq c-default-style "linux"
      c-basic-offset 8)

;; Disabling electric-indent-mode
(when (fboundp 'electric-indent-mode) (electric-indent-mode -1))

;;Setting a relative indent when return to a new line
(global-set-key (kbd "C-<return>") #'newline-and-indent)

;;Remove TAB instead of removing individual spaces
(setq backward-delete-char-untabify-method 'hungry)

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide 'aaron-theme)

;;*********************************************************************************************
;;Package management
;;MELPA Package Archive manager
(require 'package)
(add-to-list
 'package-archives
 '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;; For usage of GNU ELPA
(package-initialize)

;;To use installed packages
;;(package-install 'use-package)
(require 'use-package)

;;**************************************************
;;Rainbow delimiters
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;;General setting up
(load "d:/MyProjects/git/aarons-emacs/tuhdo_helm_setup/setup-general.el")

;;Volatile Highlighting
;;(setq volatile-highlights-mode non-nil)
;;(load "d:/MyProjects/git/aarons-emacs/tuhdo_helm_setup/setup-editing.el")

;;Tagging
;;Helm configuration
(load "d:/MyProjects/git/aarons-emacs/tuhdo_helm_setup/setup-helm-gtags.el")
(load "d:/MyProjects/git/aarons-emacs/tuhdo_helm_setup/setup-helm.el")

;;ggtags
;;(load "d:/MyProjects/git/aarons-emacs/tuhdo_helm_setup/setup-ggtags.el")

;;Auto-completion
(add-hook 'prog-mode-hook #'company-mode)

;;Syntax checking
(use-package flycheck :ensure t :init)

;;C++
(load "d:/MyProjects/git/aarons-emacs/tuhdo_helm_setup/setup-c.el")
(load "d:/MyProjects/git/aarons-emacs/tuhdo_helm_setup/setup-cedet.el")

;;PYTHON
(require 'flymake-python-pyflakes)

(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)

(setq flymake-python-pyflakes-executable "flake8")
;;Below line is for ignoring certain flags with the linter if required
;;(setq flymake-python-pyflakes-extra-arguments '("--ignore=W806"))

(use-package elpy :ensure t :init (elpy-enable))

;; Enable Flycheck for syntax checking
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;;Python Mode Hook configuration
(add-hook 'python-mode-hook (lambda()
			      (elpy-mode)
			      (flycheck-python-pyflakes-load))

(package-refresh-contents)
(package-install-selected-packages)
