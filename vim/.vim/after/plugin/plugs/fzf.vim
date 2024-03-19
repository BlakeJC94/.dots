if has_key(get(g:, 'plugs', {}), 'fzf.vim') == 0
  finish
endif

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.78 } }
let g:fzf_history_dir = '~/.local/share/fzf-history'
