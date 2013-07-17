(defvar my-packages
  '( starter-kit
     starter-kit-eshell
     starter-kit-lisp
     evil
     zenburn-theme
     nrepl
     auto-complete
     ac-nrepl))

(when (not package-archive-contents)
  (package-refresh-contents))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
