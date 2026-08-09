" vim-airline theme
" Palette: 17BEBB, 2E282A, CD5334, EDB88B, FAD8D6
"
" USAGE:
" 1. Save this file as ~/.config/nvim/autoload/airline/themes/rice.vim
"    (or ~/.vim/autoload/airline/themes/rice.vim for vim)
" 2. In your init.lua/init.vim set:
"      let g:airline_theme='rice'
"    (in init.lua: vim.g.airline_theme = 'rice')
" 3. Restart nvim

let g:airline#themes#rice#palette = {}

" [guifg, guibg, ctermfg, ctermbg, opts]
let s:bg      = '#2e282a'
let s:bg_alt  = '#3a3335'
let s:bg_alt2 = '#5c5457'
let s:fg      = '#f5e4e1'
let s:fg_dim  = '#d9c7c4'
let s:teal    = '#17bebb'
let s:red     = '#cd5334'
let s:peach   = '#edb88b'
let s:green   = '#7fb069'
let s:blue    = '#3b6e8c'
let s:magenta = '#b5657a'

" Normal mode
let s:N1 = [s:bg,     s:teal,   232, 37,  '']
let s:N2 = [s:fg,     s:bg_alt, 253, 236, '']
let s:N3 = [s:fg_dim, s:bg,     251, 235, '']
let g:airline#themes#rice#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

" Insert mode
let s:I1 = [s:bg,     s:green,  232, 71,  '']
let s:I2 = [s:fg,     s:bg_alt, 253, 236, '']
let s:I3 = [s:fg_dim, s:bg,     251, 235, '']
let g:airline#themes#rice#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)

" Visual mode
let s:V1 = [s:bg,     s:peach,  232, 216, '']
let s:V2 = [s:fg,     s:bg_alt, 253, 236, '']
let s:V3 = [s:fg_dim, s:bg,     251, 235, '']
let g:airline#themes#rice#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)

" Replace mode
let s:R1 = [s:bg,     s:red,    232, 167, '']
let s:R2 = [s:fg,     s:bg_alt, 253, 236, '']
let s:R3 = [s:fg_dim, s:bg,     251, 235, '']
let g:airline#themes#rice#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)

" Inactive windows
let s:IA1 = [s:bg_alt2, s:bg,     240, 235, '']
let s:IA2 = [s:bg_alt2, s:bg,     240, 235, '']
let s:IA3 = [s:bg_alt2, s:bg,     240, 235, '']
let g:airline#themes#rice#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)

" Terminal mode (nvim)
let g:airline#themes#rice#palette.terminal = copy(g:airline#themes#rice#palette.insert)

" Modified flag / warnings / errors accents
let s:accent_error   = [s:red,    s:bg_alt, 167, 236]
let s:accent_warning = [s:peach,  s:bg_alt, 216, 236]
let s:accent_added   = [s:green,  s:bg_alt, 71,  236]
let s:accent_modified= [s:blue,   s:bg_alt, 67,  236]
let s:accent_removed = [s:red,    s:bg_alt, 167, 236]

for s:mode in ['normal', 'insert', 'visual', 'replace', 'inactive']
  let g:airline#themes#rice#palette[s:mode].airline_a_to_airline_c = s:N1
  if !has_key(g:airline#themes#rice#palette[s:mode], 'airline_error')
    let g:airline#themes#rice#palette[s:mode].airline_error = [s:accent_error[0], s:accent_error[1], s:accent_error[2], s:accent_error[3]]
    let g:airline#themes#rice#palette[s:mode].airline_warning = [s:accent_warning[0], s:accent_warning[1], s:accent_warning[2], s:accent_warning[3]]
  endif
endfor

" Git branch / diff hunks
let g:airline#themes#rice#palette.accents = {
      \ 'red'    : [s:red,    '', 167, '', ''],
      \ 'green'  : [s:green,  '', 71,  '', ''],
      \ 'blue'   : [s:blue,   '', 67,  '', ''],
      \ 'yellow' : [s:peach,  '', 216, '', ''],
      \ 'orange' : [s:peach,  '', 216, '', ''],
      \ 'purple' : [s:magenta,'', 132, '', ''],
      \ }
