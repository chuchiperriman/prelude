;; jedi necesita el paquete (python) erp y jedi instalados
(prelude-require-packages '(emmet-mode jedi multi-web-mode))

(setq prelude-flyspell nil)
(setq prelude-guru nil)

;;pantalla completa
(defun toggle-fullscreen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                         '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                         '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
  )

(toggle-fullscreen)
;;Autoindentación
(define-key global-map (kbd "RET") 'newline-and-indent)

(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)
(define-key global-map (kbd "C-e") 'emmet-expand-line)

;;Quitamos smartparents para poder seleccionar usando C-right
(eval-after-load "prelude-editor" '(smartparens-global-mode -1))

;; Borrar línea con control + d
(global-set-key (kbd "C-d") 'prelude-kill-whole-line)

;;jedi, autocompletado python
;;(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'python-mode-hook 'jedi:setup)
(defvar jedi:setup-keys t)
(defvar jedi:complete-on-dot t)

(add-hook 'after-init-hook #'global-flycheck-mode)

;;Soporte para javascript dentro de html
(require 'multi-web-mode)
(setq mweb-default-major-mode 'html-mode)
(setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
                  (js-mode "<script[^>]*>" "</script>")
                  (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
(setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
(multi-web-global-mode 1)

