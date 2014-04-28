(use-package uniquify
  :config (setq uniquify-buffer-name-style 'forward))

(use-package saveplace
  :config (setq-default save-place t))

(use-package server
  :if window-system
  :init (unless (server-running-p) (server-start)))

(use-package edit-server
  :init (edit-server-start t))

(use-package dired-x
  :init
  (progn
    (add-hook 'dired-mode-hook 'dired-hide-details-mode)
    (put 'dired-find-alternate-file 'disabled nil)
    (setq dired-recursive-deletes 'always)
    (setq dired-recursive-copies 'always)
    (when (and (memq window-system '(mac ns)) (executable-find "gls"))
      (setq insert-directory-program "gls" dired-use-ls-dired t))))

(use-package org
  :config
  (progn
    (setq org-support-shift-select t)
    (setq org-completion-use-ido t)))

(use-package eldoc
  :init
    (dolist (hook '(emacs-lisp-mode-hook ielm-mode-hook))
      (add-hook hook 'turn-on-eldoc-mode)))

(use-package smex
  :init (smex-initialize))

(use-package dash-at-point
  :config
  (setq dash-at-point-docsets
        '("coffee" "lisp" "css" "elisp" "html" "javascript" "iphoneos"
          "ruby" "jquery" "meteor" "phonegap" "rubygems" "rails" "macosx"
          "underscore" "d3" "backbone" "bootstrap" "markdown" "zepto")))

(use-package ag
  :config
  (progn
    (setq ag-reuse-buffers t)
    (setq ag-highlight-search t)))

(use-package alert
  :config (setq alert-default-style 'notifier))

(use-package crab-mode
  :init (crab-server-start))

(use-package elisp-slime-nav
  :init
  (progn
    (dolist (hook '(emacs-lisp-mode-hook ielm-mode-hook))
      (add-hook hook 'elisp-slime-nav-mode))))

(use-package popwin
  :init (popwin-mode 1)
  :config
  (progn
    (setq popwin:popup-window-height 0.5)
    (push '("*git-gutter:diff*" :noselect t :stick t :height .3) popwin:special-display-config)
    (push '("COMMIT_EDITMSG" :height .3) popwin:special-display-config)
    (push '("*Completions*" :noselect t :height 10) popwin:special-display-config)
    (push '("* guide-key*" :height 10) popwin:special-display-config)))

(use-package projectile
  :init
  (progn
    (use-package projectile-rails
      :init (add-hook 'projectile-mode-hook 'projectile-rails-on))
    (projectile-global-mode)))

(use-package page-break-lines
  :init (global-page-break-lines-mode))

(use-package sgml-mode)

(use-package handlebars-mode)

(use-package fountain-mode
  :config
  (progn
    (add-to-list 'auto-mode-alist '("\\.fountain$" . fountain-mode))
    (add-hook 'fountain-mode-hook 'hemacs-writing-hook)))

(use-package markdown-mode
  :config (add-hook 'markdown-mode-hook 'hemacs-writing-hook))

(use-package css-mode
  :config (setq css-indent-offset 2))

(use-package less-css-mode
  :mode ("\\.scss$" . less-css-mode))

(use-package js
  :mode ("\\.json$" . js-mode)
  :init
  (progn
    (setq-default js-indent-level 2)
    (add-to-list 'interpreter-mode-alist '("node" . js-mode))))

(use-package coffee-mode
  :config (setq coffee-args-repl '("-i" "--nodejs")))

(use-package ruby-mode
  :init
  (progn
    (use-package rspec-mode)
    (use-package robe
      :init (add-hook 'ruby-mode-hook 'robe-mode))
    (use-package ruby-hash-syntax)
    (use-package rhtml-mode)
    (use-package slim-mode
      :config (setq slim-backspace-backdents-nesting nil)))
  :config
  (progn
    (setq ruby-use-smie nil)
    (setq ruby-deep-arglist nil)
    (setq ruby-deep-indent-paren nil))
  :mode (("Procfile$" . ruby-mode)
         ("\\.rabl$" . ruby-mode)
         ("\\.env\\.*" . ruby-mode)))

(use-package magit
  :config
  (progn
    (setq magit-default-tracking-name-function 'magit-default-tracking-name-branch-only)
    (setq magit-completing-read-function 'magit-ido-completing-read)
    (setq magit-emacsclient-executable "/usr/local/Cellar/emacs/HEAD/bin/emacsclient")
    (setq magit-git-executable "/usr/local/bin/git")
    (setq magit-log-auto-more t)
    (setq magit-set-upstream-on-push t)
    (setq magit-restore-window-configuration t)
    (setq magit-save-some-buffers nil)
    (setq magit-revert-item-confirm nil)
    (setq magit-stage-all-confirm nil)
    (setq magit-unstage-all-confirm nil)
    (setq magit-commit-ask-to-stage nil)
    (add-hook 'magit-log-edit-mode-hook 'flyspell-mode)))

(use-package projector
  :config
  (progn
    (setq projector-projects-root hemacs-code-dir)
    (setq projector-always-background-regex
          '("^mysql.server\\.*"
            "^bundle install"
            "^bundle update\\.*"
            "^powder restart"
            "^heroku restart\\.*"
            "^foreman start\\.*"
            "^spring stop"
            "^git push\\.*"
            "^rake db:migrate"
            "\\.*cordova run\\.*"
            "^redis-server"
            "^pkill\\.*"))))

(use-package ido
  :init
  (progn
    (ido-mode t)
    (use-package ido-ubiquitous
      :init (ido-ubiquitous-mode 1))
    (use-package ido-sort-mtime-mode
      :init (ido-sort-mtime-mode 1))
    (use-package ido-at-point
      :init (ido-at-point-mode t))
    (use-package flx-ido
      :init (flx-ido-mode 1)
      :config (setq flx-ido-use-faces nil))
    (use-package ido-vertical-mode
      :init (ido-vertical-mode 1)
      :config (setq ido-vertical-define-keys 'C-n-C-p-up-and-down)))
  :config
  (progn
    (setq ido-cannot-complete-command 'exit-minibuffer)
    (setq ido-use-virtual-buffers t)
    (setq ido-auto-merge-delay-time 1.5)
    (setq ido-enable-flex-matching t)
    (setq ido-enable-dot-prefix t)
    (setq ido-max-prospects 10)
    (setq ido-create-new-buffer 'always)
    (add-to-list 'ido-ignore-files "\\.DS_Store")))

(use-package git-gutter-fringe
  :init (global-git-gutter-mode t))

(use-package auto-dim-other-buffers
  :init (auto-dim-other-buffers-mode))

(use-package highlight-symbol
  :init
  (progn
    (add-λ 'prog-mode-hook
      (highlight-symbol-mode)))
  :config (setq highlight-symbol-idle-delay 0))

(use-package color-identifiers-mode
  :init (global-color-identifiers-mode t))

(use-package volatile-highlights
  :init (volatile-highlights-mode t))

(use-package rainbow-mode
  :init
  (progn
    (add-hook 'css-mode-hook 'rainbow-mode)
    (add-λ 'find-file-hook
      (when (and (stringp buffer-file-name)
                 (string-match ".*theme.el" buffer-file-name))
        (rainbow-mode)))))

(use-package rainbow-delimiters
  :init (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package god-mode
  :init
  (progn
    (god-mode)
    (add-λ 'god-mode-enabled-hook
      (setq cursor-type 'box))
    (add-λ 'god-mode-disabled-hook
      (setq cursor-type 'bar))
    (dolist (mode '(git-commit-mode))
      (add-to-list 'god-exempt-major-modes mode))))

(use-package guide-key
  :init (guide-key-mode 1)
  :config
  (progn
    (setq guide-key/guide-key-sequence
          '("C-x r" "C-x 4" "C-x x" "C-x v" "C-c r"
            "C-c p" "C-x +" "C-c ," "C-h" "M-s"))
    (setq guide-key/popup-window-position 'bottom)
    (setq guide-key/idle-delay 0.5)))

(use-package jump-char
  :config (setq jump-char-lazy-highlight-face nil))

(use-package undo-tree
  :init (global-undo-tree-mode))

(use-package anzu
  :init (global-anzu-mode 1))

(use-package ace-jump-char)

(use-package expand-region)

(use-package multiple-cursors)

(use-package change-inner)

(use-package popup-kill-ring)

(use-package org-repo-todo)

(use-package misc)

(use-package ace-jump-buffer
  :config (setq ajb-max-window-height 30))

(use-package imenu-anywhere)

(use-package key-chord
  :init (key-chord-mode 1)
  :config
  (progn
    (setq key-chord-two-keys-delay 0.05)
    (setq key-chord-two-keys-delay 0.1)))
