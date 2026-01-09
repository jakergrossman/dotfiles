let g:mapleader = ' '

function! Map(mappings)
    for m in a:mappings
        execute m[0] . 'noremap <silent> ' . m[1] . ' ' . m[2]
    endfor
endfunction
call Map([
\  [ 'n',  '<leader>-',  '<cmd>Ex<CR>'                                        ],
\  [ 'n',  'J',          'mzJ`z'                                              ],
\  [ 'n',  '<C-d>',      '<C-d>zz'                                            ],
\  [ 'n',  '<C-u>',      '<C-u>zz'                                            ],
\  [ 'n',  'n',          'nzzzv'                                              ],
\  [ 'n',  'N',          'Nzzzv'                                              ],
\  [ 'n',  '<leader>y',  '"+y'                                                ],
\  [ 'n',  '<leader>Y',  '"*y'                                                ],
\  [ 'v',  '<leader>y',  '"+y'                                                ],
\  [ 'v',  '<leader>Y',  '"*y'                                                ],
\  [ 'n',  'Q',          '<nop>'                                              ],
\  [ 'n',  '<C-j>',      '<cmd>cprev<CR>zz'                                   ],
\  [ 'n',  '<C-k>',      '<cmd>cnext<CR>zz'                                   ],
\  [ 'n',  '<leader>s',  ':%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>' ],
\  [ 'v',  'J',          ":m '>+1<CR>gv=gv"                                   ],
\  [ 'v',  'K',          ":m '<-2<CR>gv=gv"                                   ],
\  [ 'x',  '<leader>p',  '"_dP'                                               ],
\ ])

function! Options(opts)
    for o in a:opts | execute 'set ' . join(o, '=') | endfor
endfunction
call Options([
\   [ "autoindent"                                                            ],
\   [ "smartindent"                                                           ],
\   [ "visualbell"                                                            ],
\   [ "tabstop",        4                                                     ],
\   [ "softtabstop",    4                                                     ],
\   [ "shiftwidth",     4                                                     ],
\   [ "expandtab"                                                             ],
\   [ "laststatus",     2                                                     ],
\   [ "ruler",                                                                ],
\   [ "splitright",                                                           ],
\   [ "splitbelow",                                                           ],
\   [ "nohlsearch",                                                           ],
\   [ "noincsearch",                                                          ],
\   [ "textwidth",      80                                                    ],
\   [ "colorcolumn",    "+0",                                                 ],
\   [ "smartindent"                                                           ],
\   [ "noswapfile",                                                           ],
\   [ "nobackup",                                                             ],
\   [ "undodir",        expand("~/.vim/undodir")                              ],
\   [ "undofile",                                                             ],
\   [ "nowrap",                                                               ],
\   [ "scrolloff",      8                                                     ],
\   [ "signcolumn",     "yes"                                                 ],
\   [ "updatetime",     50                                                    ],
\   [ "termguicolors"                                                         ],
\   [ "listchars",      'tab:>\ ,trail:*,space:.'                             ],
\   [ "list",                                                                 ],
\   [ "number",                                                               ],
\ ])

augroup rc
    autocmd!
    autocmd ColorScheme * highlight Whitespace guibg=NONE
augroup END
try
    colorscheme meh
catch
endtry

filetype plugin indent on
syntax on

if has('nvim') && filereadable(expand("~/.config/nvim/init_nvim.lua"))
    luafile ~/.config/nvim/init_nvim.lua
endif
