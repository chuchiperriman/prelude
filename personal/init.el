(prelude-require-packages '(emmet-mode))

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

(eval-after-load "prelude-editor" '(smartparens-global-mode -1))
