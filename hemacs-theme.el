;;; hemacs --- an emacs configuration -*- lexical-binding: t; -*-

(deftheme hemacs)

(defvar hemacs-theme-variant 'dark)

(defun hemacs-theme-toggle-variant ()
  (interactive)
  (if (eq hemacs-theme-variant 'light)
      (setq hemacs-theme-variant 'dark)
    (setq hemacs-theme-variant 'light))
  (load-theme 'hemacs :no-confirm))

(let* ((class '((class color) (min-colors 89)))
       (base00 (if (eq hemacs-theme-variant 'light) "#eee8d5" "#393939"))
       (base01 (if (eq hemacs-theme-variant 'light) "#839496" "#747369"))
       (base02 (if (eq hemacs-theme-variant 'light) "#586e75" "#a09f93"))
       (base03 (if (eq hemacs-theme-variant 'light) "#073642" "#e8e6df"))
       (yellow (if (eq hemacs-theme-variant 'light) "#b58900" "#ffcc66"))
       (orange (if (eq hemacs-theme-variant 'light) "#cb4b16" "#f99157"))
       (red    (if (eq hemacs-theme-variant 'light) "#dc322f" "#f2777a"))
       (purple (if (eq hemacs-theme-variant 'light) "#d33682" "#cc99cc"))
       (blue   (if (eq hemacs-theme-variant 'light) "#268bd2" "#6699cc"))
       (aqua   (if (eq hemacs-theme-variant 'light) "#2aa198" "#66cccc"))
       (green  (if (eq hemacs-theme-variant 'light) "#859900" "#99cc99"))
       (pink "#FF1493")
       (base00-1 (if (eq hemacs-theme-variant 'light)
                     (color-lighten-name base00 4)
                   (color-darken-name base00 4)))
       (base00-2 (if (eq hemacs-theme-variant 'light)
                     (color-lighten-name base00 8)
                   (color-darken-name base00 8)))
       (base00+1 (if (eq hemacs-theme-variant 'light)
                     (color-darken-name base00 4)
                   (color-lighten-name base00 4)))
       (base00+2 (if (eq hemacs-theme-variant 'light)
                     (color-darken-name base00 8)
                   (color-lighten-name base00 8)))
       (red-1 (color-darken-name red 10))
       (orange-1 (color-darken-name orange 10))
       (yellow-1 (if (eq hemacs-theme-variant 'light)
                     (color-lighten-name yellow 10)
                   (color-darken-name yellow 10)))
       (yellow-2 (if (eq hemacs-theme-variant 'light)
                     (color-lighten-name yellow 33)
                   (color-darken-name yellow 33)))
       (green-1 (color-darken-name green 10))
       (aqua-1  (color-darken-name aqua 10))
       (blue-1 (color-darken-name blue 10))
       (purple-1 (color-darken-name purple 10))
       (purple-2 (color-darken-name purple 33)))

  (custom-theme-set-faces
   'hemacs

   `(default ((t (:background ,base00 :foreground ,base03))))
   `(border ((t (:background ,base02))))
   `(cursor ((t (:background ,pink :inverse-video t))))
   `(highlight ((t (:background ,base00+1))))
   `(hl-line ((t (:background ,base00-1))))
   `(link ((t (:foreground ,blue :underline t))))
   `(link-visited ((t (:inherit link :foreground ,purple))))
   `(minibuffer-prompt ((t (:foreground ,blue))))
   `(region ((t (:background ,base00+2))))
   `(vhl/default-face ((t (:background ,base00+1))))
   `(trailing-whitespace ((t (:background ,base00+1 :foreground ,yellow))))
   `(next-error ((t (:background ,base01))))
   `(secondary-selection ((t (:background ,yellow-2))))
   `(header-line ((t (:foreground ,purple :background nil))))
   `(auto-dim-other-buffers-face ((t (:background ,base00+1))))
   `(fringe ((t (:background ,base00+1 :foreground ,base02))))
   `(linum ((t (:inherit fringe))))
   `(vertical-border ((t (:foreground ,base01))))
   `(widget-button ((t (:underline t))))
   `(widget-field ((t (:background ,base02 :box (:line-width 1 :color ,base03)))))
   `(error ((t (:foreground ,red))))
   `(warning ((t (:foreground ,orange :weight bold))))
   `(success ((t (:foreground ,green :weight bold))))
   `(ace-jump-face-background ((t (:foreground ,base01))))
   `(ace-jump-face-foreground ((t (:foreground ,red :weight bold))))
   `(ajb-face ((t :background ,base00+1)))

   `(font-lock-builtin-face ((t (:foreground ,aqua))))
   `(font-lock-comment-face ((t (:foreground ,base02))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,base01))))
   `(font-lock-constant-face ((t (:foreground ,orange))))
   `(font-lock-doc-face ((t (:foreground ,base02))))
   `(font-lock-function-name-face ((t (:foreground ,blue))))
   `(font-lock-keyword-face ((t (:foreground ,purple))))
   `(font-lock-negation-char-face ((t (:foreground ,green))))
   `(font-lock-preprocessor-face ((t (:foreground ,blue))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,yellow))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,purple))))
   `(font-lock-string-face ((t (:foreground ,green))))
   `(font-lock-type-face ((t (:foreground ,yellow))))
   `(font-lock-variable-name-face ((t (:foreground ,aqua))))
   `(font-lock-warning-face ((t (:foreground ,red))))

   `(mode-line
     ((t (:box
          (:line-width 4 :color ,base00-2 :style nil)
          :height 0.9
          :background ,base00-2 :foreground ,base03))))
   `(mode-line-inactive
     ((t (:box
          (:line-width 4 :color ,base00-1 :style nil)
          :height 0.9 :background ,base00-1 :foreground ,base02))))
   `(mode-line-buffer-id ((t (:foreground ,purple :background nil))))
   `(mode-line-emphasis ((t (:foreground ,base02 :slant italic))))
   `(mode-line-highlight ((t (:foreground ,purple :box nil :weight bold))))
   `(powerline-active1 ((t :background ,base00)))
   `(powerline-active2 ((t :background ,base00+1)))
   `(powerline-inactive1 ((t :background ,base00-1)))
   `(powerline-inactive2 ((t :background ,base00-1)))
   `(alert-trivial-face ((t (:inherit nil :foreground nil :background nil))))
   `(anzu-mode-line ((t (:foreground ,yellow))))
   `(persp-selected-face ((t (:foreground ,base03))))
   `(mm-command-output ((t (:foreground unspecified :background unspecified))))

   `(match ((t (:foreground ,blue :background ,base00+1 :inverse-video t :weight bold))))
   `(isearch ((t (:inherit match :foreground ,purple))))
   `(query-replace ((t (:inherit isearch))))
   `(anzu-replace-to ((t (:foreground ,yellow :background ,base00+1))))
   `(lazy-highlight ((t (:foreground ,yellow))))
   `(isearch-lazy-highlight-face ((t (:foreground ,yellow))))
   `(isearch-fail ((t (:inherit font-lock-warning-face))))
   `(regex-tool-matched-face ((t (:foreground nil :background nil :inherit match))))
   `(ag-match-face ((t (:inherit isearch-lazy-highlight-face))))
   `(custom-state ((t (:foreground ,green))))

   `(wgrep-face ((t (:background ,base00+2))))

   `(guide-key/highlight-command-face ((t (:foreground ,yellow))))
   `(guide-key/key-face ((t (:foreground ,pink))))
   `(guide-key/prefix-command-face ((t (:foreground ,aqua))))

   `(tabbar-default ((t (:inherit default :box (:line-width 4 :color ,base00 :style nil) :foreground ,base02 :background "black"))))
   `(tabbar-button ((t (:height 0.8 :box (:line-width 4 :color ,base00-2 :style nil)))))
   `(tabbar-unselected ((t (:inherit tabbar-button :background ,base00-2))))
   `(tabbar-modified ((t (:inherit tabbar-unselected))))
   `(tabbar-selected ((t (:inherit tabbar-button :box (:line-width 4 :color ,base00 :style nil)))))
   `(tabbar-separator ((t (:inherit tabbar-selected))))

   `(company-tooltip ((t (:background ,base00-1 :foreground ,base02))))
   `(company-tooltip-selection ((t (:background ,base00-2 :foreground ,base03))))
   `(company-tooltip-common ((t (:inherit company-tooltip))))
   `(company-tooltip-common-selection ((t (:inherit company-tooltip-selection))))
   `(company-tooltip-search ((t (:foreground ,yellow))))
   `(company-echo-common ((t (:inherit company-tooltip :foreground ,yellow))))
   `(company-scrollbar-bg ((t (:background ,base00+1))))
   `(company-scrollbar-fg ((t (:background ,base01))))
   `(company-tooltip-annotation ((t (:inherit company-tooltip :foreground ,base01))))
   `(company-preview ((t (:background ,base00 :foreground ,base02))))
   `(company-preview-common ((t (:foreground ,base02))))
   `(company-preview-search ((t (:background ,base00))))

   `(tooltip ((t (:background ,base03 :foreground ,base00 :height 0.9))))
   `(popup-tip-face ((t (:inherit tooltip))))
   `(popup-face ((t (:foreground ,base00+1 :background ,base03))))
   `(popup-menu-selection-face ((t (:foreground ,base03 :background ,blue))))
   `(popup-isearch-match ((t (:foreground ,yellow :background nil))))
   `(popup-scroll-bar-foreground-face ((t (:inherit company-scrollbar-fg))))
   `(popup-scroll-bar-background-face ((t (:background ,base02))))

   `(flymake-warnline ((t (:underline ,orange :background ,base00+1))))
   `(flymake-errline ((t (:underline ,red :background ,base00+1))))

   `(flycheck-error ((t (:underline (:style wave :color ,red) :inherit unspecified))))
   `(flycheck-info ((t (:underline (:style wave :color ,green) :inherit unspecified))))
   `(flycheck-warning ((t (:underline (:style wave :color ,orange) :inherit unspecified))))

   `(swoop-face-target-words ((t (:foreground ,yellow))))
   `(swoop-face-target-line ((t (:background ,base01))))
   `(swoop-face-line-buffer-name ((t (:inherit header-line :foreground ,base02))))
   `(swoop-face-header-format-line ((t (:inherit swoop-face-line-buffer-name :foreground ,purple))))
   `(swoop-face-line-number ((t (:foreground ,base02))))

   `(helm-match ((t (:foreground ,yellow-1))))
   `(helm-source-header ((t (:family inherit :inherit header-line :foreground ,purple))))
   `(helm-visible-mark ((t (:background ,green))))
   `(helm-header ((t (:inherit header-line))))
   `(helm-candidate-number ((t (:background unspecified))))
   `(helm-selection ((t (:background ,base00+2))))
   `(helm-selection-line ((t (:inherit helm-selection))))
   `(helm-separator ((t (:foreground ,base01))))
   `(helm-action ((t (:underline nil))))
   `(helm-prefarg ((t (:foreground ,green))))
   `(helm-buffer-saved-out ((t (:foreground ,red))))
   `(helm-buffer-not-saved ((t (:foreground ,red))))
   `(helm-buffer-size ((t (:foreground ,base02))))
   `(helm-buffer-process ((t (:foreground ,base02))))
   `(helm-buffer-directory ((t (:foreground ,orange))))
   `(helm-M-x-key ((t (:foreground ,base02))))
   `(helm-ff-prefix ((t (:foreground ,yellow))))
   `(helm-ff-executable ((t (:foreground ,green))))
   `(helm-ff-directory ((t (:inherit helm-buffer-directory))))
   `(helm-ff-symlink ((t (:foreground ,orange))))
   `(helm-ff-invalid-symlink ((t (:inherit helm-ff-symlink :underline (:style wave :color ,red)))))
   `(helm-grep-match ((t (:inherit match))))
   `(helm-grep-file ((t (:foreground ,base01))))
   `(helm-grep-lineno ((t (:foreground ,base02))))
   `(helm-grep-running ((t (:inherit compilation-mode-line-run))))
   `(helm-grep-finish ((t (:inherit success))))
   `(helm-visible-mark ((t (:inverse-video t))))
   `(helm-swoop-target-word-face ((t (:foreground ,yellow))))
   `(helm-swoop-target-line-face ((t (:background ,base00+2))))
   `(helm-swoop-target-line-block-face ((t (:background ,base00+1))))
   `(helm-swoop-line-number-face ((t (:foreground ,base01))))
   `(helm-ls-git-added-modified-face ((t (:foreground ,aqua))))
   `(helm-ls-git-conflict-face ((t (:foreground ,purple-1))))
   `(helm-ls-git-deleted-and-staged-face ((t (:foreground ,base02))))
   `(helm-ls-git-deleted-not-staged-face ((t (:foreground ,orange-1))))
   `(helm-ls-git-modified-and-staged-face ((t (:foreground ,yellow))))
   `(helm-ls-git-modified-not-staged-face ((t (:foreground ,yellow))))
   `(helm-ls-git-renamed-modified-face ((t (:foreground ,yellow))))
   `(helm-ls-git-untracked-face ((t (:foreground ,blue))))

   `(show-paren-match ((t (:underline (:style line :color ,pink)))))
   `(show-paren-mismatch ((t (:background ,red :foreground ,base00-2))))

   `(highlight-symbol-face ((t (:foreground unspecified :background unspecified :underline (:style line :color ,pink)))))

   `(rainbow-delimiters-depth-1-face ((t (:foreground ,purple))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,blue))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,aqua))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,green))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,yellow))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,orange))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,purple-1))))
   `(rainbow-delimiters-depth-8-face ((t (:foreground ,blue-1))))
   `(rainbow-delimiters-depth-9-face ((t (:foreground ,aqua-1))))
   `(rainbow-delimiters-depth-10-face ((t (:foreground ,green-1))))
   `(rainbow-delimiters-depth-11-face ((t (:foreground ,yellow-1))))
   `(rainbow-delimiters-depth-12-face ((t (:foreground ,orange-1))))
   `(rainbow-delimiters-mismatched-face ((t (:foreground ,red))))
   `(rainbow-delimiters-unmatched-face ((t (:foreground ,red))))

   `(ido-subdir ((t (:foreground ,orange))))
   `(ido-first-match ((t (:foreground ,yellow :weight bold))))
   `(ido-only-match ((t (:foreground ,red :weight bold))))
   `(ido-indicator ((t (:foreground ,red :background ,base00+1))))
   `(ido-virtual ((t (:foreground ,aqua))))
   `(flx-highlight-face ((t (:foreground ,green))))

   `(whitespace-empty ((t (:foreground ,red :background ,yellow))))
   `(whitespace-hspace ((t (:background ,base03 :foreground ,base03))))
   `(whitespace-indentation ((t (:background ,yellow :foreground ,red))))
   `(whitespace-line ((t (:background ,base00+1 :foreground ,orange))))
   `(whitespace-newline ((t (:foreground ,base03))))
   `(whitespace-space ((t (:background ,base00+1 :foreground ,base03))))
   `(whitespace-space-after-tab ((t (:background ,yellow :foreground ,red))))
   `(whitespace-space-before-tab ((t (:background ,orange :foreground ,red))))
   `(whitespace-tab ((t (:background ,base03 :foreground ,base03))))
   `(whitespace-trailing ((t (:background ,red :foreground ,yellow))))

   `(diff-added ((t (:foreground ,green))))
   `(diff-changed ((t (:foreground ,yellow))))
   `(diff-removed ((t (:foreground ,red))))
   `(diff-header ((t (:background ,base00+1))))
   `(diff-file-header ((t (:foreground ,base01))))
   `(diff-hunk-header ((t (:foreground ,base01))))
   `(ediff-even-diff-A ((t (:foreground nil :background nil :inverse-video t))))
   `(ediff-even-diff-B ((t (:foreground nil :background nil :inverse-video t))))
   `(ediff-odd-diff-A  ((t (:foreground ,base03 :background nil :inverse-video t))))
   `(ediff-odd-diff-B  ((t (:foreground ,base03 :background nil :inverse-video t))))

   `(git-gutter:added ((t (:foreground ,base02))))
   `(git-gutter:deleted ((t (:foreground ,base02))))
   `(git-gutter:modified ((t (:foreground ,base02))))

   `(diff-hl-insert ((t (:foreground ,green-1 :background ,base00+2))))
   `(diff-hl-unknown ((t (:foreground ,green-1 :background ,base00+2))))
   `(diff-hl-delete ((t (:foreground ,red-1 :background ,base00+2))))
   `(diff-hl-change ((t (:foreground ,blue-1 :background ,base00+2))))

   `(eldoc-highlight-function-argument ((t (:foreground ,green :weight bold))))

   `(undo-tree-visualizer-default-face ((t (:foreground ,base03))))
   `(undo-tree-visualizer-current-face ((t (:foreground ,green :weight bold))))
   `(undo-tree-visualizer-active-branch-face ((t (:foreground ,red))))
   `(undo-tree-visualizer-register-face ((t (:foreground ,yellow))))

   `(diredp-compressed-file-suffix ((t (:foreground ,blue))))
   `(diredp-dir-heading ((t (:foreground nil :background nil :inherit heading))))
   `(diredp-dir-priv ((t (:foreground ,aqua :background nil))))
   `(diredp-exec-priv ((t (:foreground ,blue :background nil))))
   `(diredp-executable-tag ((t (:foreground ,red :background nil))))
   `(diredp-file-name ((t (:foreground ,yellow))))
   `(diredp-file-suffix ((t (:foreground ,green))))
   `(diredp-flag-mark-line ((t (:background nil :inherit highlight))))
   `(diredp-ignored-file-name ((t (:foreground ,base03))))
   `(diredp-link-priv ((t (:background nil :foreground ,purple))))
   `(diredp-mode-line-flagged ((t (:foreground ,red))))
   `(diredp-mode-line-marked ((t (:foreground ,green))))
   `(diredp-no-priv ((t (:background nil))))
   `(diredp-number ((t (:foreground ,yellow))))
   `(diredp-other-priv ((t (:background nil :foreground ,purple))))
   `(diredp-rare-priv ((t (:foreground ,red :background nil))))
   `(diredp-read-priv ((t (:foreground ,green :background nil))))
   `(diredp-symlink ((t (:foreground ,purple))))
   `(diredp-write-priv ((t (:foreground ,yellow :background nil))))

   `(magit-process-ok ((t (:foreground ,green))))
   `(magit-process-ng ((t (:foreground ,red))))
   `(magit-tag ((t (:foreground ,aqua))))
   `(magit-log-author ((t (:foreground ,base02))))
   `(magit-log-date ((t (:foreground ,base02))))
   `(magit-log-graph ((t (:foreground ,base02))))
   `(magit-hash ((t (:foreground ,aqua))))
   `(magit-branch-local ((t (:foreground ,yellow))))
   `(magit-branch-remote ((t (:foreground ,yellow))))
   `(magit-branch-label ((t (:foreground ,yellow))))
   `(magit-branch-current ((t (:foreground ,yellow-1))))
   `(magit-head ((t (:foreground ,aqua))))
   `(magit-section-highlight ((t (:inherit highlight))))
   `(magit-section-heading ((t (:foreground ,purple :weight bold))))
   `(magit-dimmed ((t (:background ,base00-2))))
   `(magit-refname ((t (:foreground ,orange))))
   `(magit-diff-added ((t (:foreground ,green :background unspecified))))
   `(magit-diff-removed ((t (:foreground ,red :background unspecified))))
   `(magit-diff-context ((t (:foreground unspecified :background unspecified))))
   `(magit-diff-added-highlight ((t (:foreground ,green :background ,base00-1))))
   `(magit-diff-removed-highlight ((t (:foreground ,red :background ,base00-1))))
   `(magit-diff-context-highlight ((t (:foreground unspecified :background ,base00-1))))
   `(magit-diffstat-added ((t (:foreground ,green :background unspecified))))
   `(magit-diffstat-removed ((t (:foreground ,red :background unspecified))))
   `(magit-cherry-unmatched ((t (:foreground ,aqua))))
   `(magit-cherry-equivalent ((t (:foreground ,purple))))
   `(magit-blame-heading ((t (:foreground unspecified :background unspecified))))
   `(magit-diff-hunk-heading ((t (:foreground ,base01))))
   `(magit-diff-hunk-heading-highlight ((t (:inherit magit-diff-hunk-heading :background ,base00-1))))
   `(magit-diff-hunk-heading-selection ((t (:foregroud unspecified))))
   `(magit-diff-lines-heading ((t (:background unspecified))))

   `(ediff-current-diff-A ((t (:foreground ,base03 :background ,red-1))))
   `(ediff-current-diff-Ancestor ((t (:foreground ,base03 :background ,red-1))))
   `(ediff-current-diff-B ((t (:foreground ,base03 :background ,green-1))))
   `(ediff-current-diff-C ((t (:foreground ,base03 :background ,blue-1))))
   `(ediff-even-diff-A ((t (:background ,base00+2))))
   `(ediff-even-diff-Ancestor ((t (:background ,base00+2))))
   `(ediff-even-diff-B ((t (:background ,base00+2))))
   `(ediff-even-diff-C ((t (:background ,base00+2))))
   `(ediff-fine-diff-A ((t (:foreground ,base03 :background ,red-1 :weight bold))))
   `(ediff-fine-diff-Ancestor ((t (:foreground ,base03 :background ,red-1 weight bold))))
   `(ediff-fine-diff-B ((t (:foreground ,base03 :background ,green-1 :weight bold))))
   `(ediff-fine-diff-C ((t (:foreground ,base03 :background ,blue-1 :weight bold ))))
   `(ediff-odd-diff-A ((t (:background ,base01))))
   `(ediff-odd-diff-Ancestor ((t (:background ,base01))))
   `(ediff-odd-diff-B ((t (:background ,base01))))
   `(ediff-odd-diff-C ((t (:background ,base01))))

   `(compilation-info ((t (:foreground ,base02 :underline t))))
   `(compilation-column-number ((t (:foreground ,base02))))
   `(compilation-line-number ((t (:foreground ,base02))))
   `(compilation-message-face ((t (:foreground ,blue))))
   `(compilation-mode-line-exit ((t (:inherit nil :foreground unspecified :background unspecified))))
   `(compilation-mode-line-fail ((t (:inherit nil :foreground unspecified :background unspecified))))
   `(compilation-mode-line-run ((t (:inherit nil :foreground unspecified :background unspecified))))

   `(org-date ((t (:foreground ,purple))))
   `(org-done ((t (:foreground ,green))))
   `(org-checkbox ((t (:foreground ,purple))))
   `(org-agenda-structure ((t (:foreground ,purple))))
   `(org-agenda-date ((t (:foreground ,blue :underline nil))))
   `(org-agenda-done ((t (:foreground ,green))))
   `(org-agenda-dimmed-todo-face ((t (:foreground ,base03))))
   `(org-block ((t (:foreground ,orange))))
   `(org-code ((t (:foreground ,yellow))))
   `(org-column ((t (:background ,base02))))
   `(org-column-title ((t (:inherit org-column :weight bold :underline t))))
   `(org-document-info ((t (:foreground ,aqua))))
   `(org-document-info-keyword ((t (:foreground ,green))))
   `(org-document-title ((t (:weight bold :foreground ,orange :height 1.44))))
   `(org-ellipsis ((t (:foreground ,base03))))
   `(org-footnote ((t (:foreground ,aqua))))
   `(org-formula ((t (:foreground ,red))))
   `(org-hide ((t (:foreground ,base02))))
   `(org-link ((t (:foreground ,blue))))
   `(org-scheduled ((t (:foreground ,green))))
   `(org-scheduled-previously ((t (:foreground ,orange))))
   `(org-scheduled-today ((t (:foreground ,green))))
   `(org-special-keyword ((t (:foreground ,orange))))
   `(org-table ((t (:foreground ,purple))))
   `(org-todo ((t (:foreground ,red))))
   `(org-upcoming-deadline ((t (:foreground ,orange))))
   `(org-warning ((t (:weight bold :foreground ,red))))

   `(markdown-url-face ((t (:inherit link))))
   `(markdown-link-face ((t (:foreground ,blue :underline t))))

   `(js2-warning-face ((t (:underline ,orange))))
   `(js2-error-face ((t (:foreground nil :underline ,red))))
   `(js2-external-variable-face ((t (:foreground ,purple))))
   `(js2-function-param-face ((t (:foreground ,blue))))
   `(js2-instance-member-face ((t (:foreground ,blue))))
   `(js2-private-function-call-face ((t (:foreground ,red))))
   `(js3-warning-face ((t (:underline ,orange))))
   `(js3-error-face ((t (:foreground nil :underline ,red))))
   `(js3-external-variable-face ((t (:foreground ,purple))))
   `(js3-function-param-face ((t (:foreground ,blue))))
   `(js3-jsdoc-tag-face ((t (:foreground ,orange))))
   `(js3-jsdoc-type-face ((t (:foreground ,aqua))))
   `(js3-jsdoc-value-face ((t (:foreground ,yellow))))
   `(js3-jsdoc-html-tag-name-face ((t (:foreground ,blue))))
   `(js3-jsdoc-html-tag-delimiter-face ((t (:foreground ,green))))
   `(js3-instance-member-face ((t (:foreground ,blue))))
   `(js3-private-function-call-face ((t (:foreground ,red))))

   `(erb-face ((t (:background ,base00+1 :foreground ,base03))))
   `(erb-delim-face ((t (:background ,base00+1 :foreground ,red))))
   `(erb-exec-face ((t (:background ,base00+1 :foreground ,base02))))
   `(erb-exec-delim-face ((t (:background ,base00+1 :foreground ,red))))
   `(erb-out-face ((t (:background ,base00+1 :foreground ,base03))))
   `(erb-out-delim-face ((t (:background ,base00+1 :foreground ,red))))
   `(erb-comment-face ((t (:background ,base00+1 :foreground ,base02))))
   `(erb-comment-delim-face ((t (:background ,base00+1 :foreground ,base01))))

   `(pulse-highlight-face ((t (:background ,yellow-2))))
   `(pulse-highlight-start-face ((t (:background ,yellow-2)))))

  (custom-theme-set-variables
   'hemacs

   `(evil-emacs-state-cursor '(,red bar))
   `(evil-insert-state-cursor '(,red hbar))
   `(evil-normal-state-cursor '(,yellow box))
   `(evil-visual-state-cursor '(,green box))
   `(pos-tip-foreground-color ,base02)
   `(pos-tip-background-color ,base00-1)

   `(highlight-symbol-foreground-color ,base03)
   `(highlight-symbol-colors '(,yellow
                               ,green
                               ,aqua
                               ,blue
                               ,purple
                               ,orange))

   `(highlight-tail-colors '((,yellow-2 . 0)
                             (,purple-2 . 10)
                             (,base01 . 20)
                             (,base00+1 . 45)
                             (,base00 . 70)))

   `(tabbar-background-color ,base00-2)

   `(ansi-color-names-vector
     [,base00 ,red ,green ,yellow ,blue ,purple ,blue ,base03])
   `(ansi-term-color-vector
     [unspecified ,base00 ,red ,green ,yellow ,blue ,purple ,blue ,base03])))

;; Local Variables:
;; eval: (rainbow-mode)
;; flycheck-disabled-checkers: (emacs-lisp-checkdoc)
;; End:

(provide-theme 'hemacs)
;;; hemacs-theme.el ends here
