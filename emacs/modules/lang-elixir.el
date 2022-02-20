
(use-package elixir-mode
  :hook ((elixir-mode . lsp-deferred)))
(use-package alchemist
  :hook (elixir-mode . alchemist-mode))

(provide 'lang-elixir)
