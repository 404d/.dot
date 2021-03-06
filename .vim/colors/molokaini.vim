" Vim color file
"
" Author: Tomas Restrepo <tomas@winterdom.com>
"
" Note: Based on the monokai theme for textmate
" by Wimer Hazenberg and its darker variant 
" by Hamish Stuart Macpherson
"

hi clear

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="molokaini"

if exists("g:molokai_original")
    let s:molokai_original = g:molokai_original
else
    let s:molokai_original = 0
endif

" Alternatives:
" #320113: #45021a, #6b0329

hi Boolean         guifg=#AE81FF guibg=#190046
hi Character       guifg=#E6DB74 guibg=#3d380b
hi Number          guifg=#AE81FF guibg=#190046
hi String          guifg=#E6DB74 guibg=#3d380b
hi Conditional     guifg=#F92672 guibg=#320113 gui=bold
hi Constant        guifg=#AE81FF guibg=#190046 gui=bold
hi Cursor          guifg=#000000 guibg=#F8F8F0
hi Debug           guifg=#BCA3A3               gui=bold
hi Define          guifg=#66D9EF guibg=#06333c
hi Delimiter       guifg=#8F8F8F
hi DiffAdd                       guibg=#13354A
"DiffChange guifg=#89807D  
hi DiffChange                    guibg=#4C4745 
hi DiffDelete      guifg=#960050 guibg=#1E0010
hi DiffText                      guibg=#4C4745 gui=italic,bold

hi Directory       guifg=#A6E22E               gui=bold
hi Error           guifg=#960050 guibg=#1E0010
hi ErrorMsg        guifg=#F92672 guibg=#232526 gui=bold
hi Exception       guifg=#A6E22E guibg=#2f4309 gui=bold
hi Float           guifg=#AE81FF guibg=#190046
hi FoldColumn      guifg=#465457 guibg=#000000
hi Folded          guifg=#465457 guibg=#000000
hi Function        guifg=#A6E22E guibg=#2f4309
hi Identifier      guifg=#FD971F guibg=#442501
hi Namespace       guifg=#FD971F guibg=#442501
hi Ignore          guifg=#808080 guibg=bg
hi IncSearch       guifg=#C4BE89 guibg=#000000

hi Keyword         guifg=#F92672 guibg=#320113 gui=bold
hi Label           guifg=#E6DB74 guibg=#3d380b gui=none
hi Macro           guifg=#C4BE89               gui=italic
hi SpecialKey      guifg=#66D9EF guibg=#06333c gui=italic

hi MatchParen      guifg=#000000 guibg=#FD971F gui=bold
hi ModeMsg         guifg=#E6DB74 guibg=#3d380b
hi MoreMsg         guifg=#E6DB74 guibg=#3d380b
hi Operator        guifg=#F92672 guibg=#320113

" complete menu
hi Pmenu           guifg=#66D9EF guibg=#000000
hi PmenuSel                      guibg=#808080
hi PmenuSbar                     guibg=#080808
hi PmenuThumb      guifg=#66D9EF

hi PreCondit       guifg=#A6E22E guibg=#2f4309 gui=bold 
hi PreProc         guifg=#A6E22E guibg=#2f4309
hi Question        guifg=#66D9EF guibg=#06333c
hi Repeat          guifg=#F92672               gui=bold
hi Search          guifg=#FFFFFF guibg=#455354
" marks column
hi SignColumn      guifg=#A6E22E guibg=#232526
hi SpecialChar     guifg=#F92672               gui=bold
hi SpecialComment  guifg=#465457               gui=bold
hi Special         guifg=#66D9EF guibg=#06333c gui=italic
hi SpecialKey      guifg=#888A85               gui=italic
if has("spell")
    hi SpellBad    guisp=#FF0000 gui=undercurl
    hi SpellCap    guisp=#7070F0 gui=undercurl
    hi SpellLocal  guisp=#70F0F0 gui=undercurl
    hi SpellRare   guisp=#FFFFFF gui=undercurl
endif
hi Statement       guifg=#F92672 guibg=#320113 gui=bold
hi StatusLine      guifg=#455354 guibg=fg
hi StatusLineNC    guifg=#808080 guibg=#080808
hi StorageClass    guifg=#FD971F guibg=#442501 gui=italic
hi Structure       guifg=#66D9EF guibg=#06333c
hi Tag             guifg=#F92672 guibg=#320113 gui=italic
hi Title           guifg=#ef5939
hi Todo            guifg=#FFFFFF guibg=bg      gui=bold

hi Typedef         guifg=#66D9EF guibg=#06333c
hi Type            guifg=#66D9EF guibg=#06333c gui=none
hi Underlined      guifg=#808080               gui=underline

hi VertSplit       guifg=#808080 guibg=#080808 gui=bold
hi VisualNOS                     guibg=#403D3D
hi Visual                        guibg=#403D3D
hi WarningMsg      guifg=#FFFFFF guibg=#333333 gui=bold
hi WildMenu        guifg=#66D9EF guibg=#000000

if s:molokai_original == 1
   hi Normal          guifg=#F8F8F2 guibg=#272822
   hi Comment         guifg=#75715E guibg=#121212
   hi CursorLine                    guibg=#3E3D32
   hi CursorColumn                  guibg=#3E3D32
   hi LineNr          guifg=#BCBCBC guibg=#3B3A32
   hi NonText         guifg=#BCBCBC guibg=#3B3A32
else
   hi Normal          guifg=#F8F8F2 guibg=#1B1D1E
   hi Comment         guifg=#465457
   hi CursorLine                    guibg=#293739
   hi CursorColumn                  guibg=#293739
   hi LineNr          guifg=#BCBCBC guibg=#232526
   hi NonText         guifg=#BCBCBC guibg=#232526
end

"
" Support for 256-color terminal
"
if &t_Co > 255
   hi Boolean         ctermfg=135
   hi Character       ctermfg=144
   hi Number          ctermfg=135
   hi String          ctermfg=144
   hi Conditional     ctermfg=161               cterm=bold
   hi Constant        ctermfg=135               cterm=bold
   hi Cursor          ctermfg=16  ctermbg=253
   hi Debug           ctermfg=225               cterm=bold
   hi Define          ctermfg=81
   hi Delimiter       ctermfg=241

   hi DiffAdd                     ctermbg=24
   " DiffChange ctermfg=181
   hi DiffChange                  ctermbg=239
   hi DiffDelete      ctermfg=162 ctermbg=53
   hi DiffText                    ctermbg=102 cterm=bold

   hi Directory       ctermfg=118               cterm=bold
   hi Error           ctermfg=219 ctermbg=89
   hi ErrorMsg        ctermfg=199 ctermbg=16    cterm=bold
   hi Exception       ctermfg=118               cterm=bold
   hi Float           ctermfg=135
   hi FoldColumn      ctermfg=67  ctermbg=16
   hi Folded          ctermfg=67  ctermbg=16
   hi Function        ctermfg=118
   hi Identifier      ctermfg=208               cterm=none
   hi Namespace       ctermfg=208               cterm=none
   hi Ignore          ctermfg=244 ctermbg=232
   hi IncSearch       ctermfg=193 ctermbg=16

   hi Keyword         ctermfg=161               cterm=bold
   hi Label           ctermfg=229               cterm=none
   hi Macro           ctermfg=193
   hi SpecialKey      ctermfg=81

   hi MatchParen      ctermfg=16  ctermbg=208 cterm=bold
   hi ModeMsg         ctermfg=229
   hi MoreMsg         ctermfg=229
   hi Operator        ctermfg=161

   " complete menu
   hi Pmenu           ctermfg=81  ctermbg=16
   hi PmenuSel                    ctermbg=244
   hi PmenuSbar                   ctermbg=232
   hi PmenuThumb      ctermfg=81

   hi PreCondit       ctermfg=118               cterm=bold
   hi PreProc         ctermfg=118
   hi Question        ctermfg=81
   hi Repeat          ctermfg=161               cterm=bold
   hi Search          ctermfg=253 ctermbg=66

   " marks column
   hi SignColumn      ctermfg=118 ctermbg=235
   hi SpecialChar     ctermfg=161               cterm=bold
   hi SpecialComment  ctermfg=245               cterm=bold
   hi Special         ctermfg=81  ctermbg=232
   hi SpecialKey      ctermfg=245

   hi Statement       ctermfg=161               cterm=bold
   hi StatusLine      ctermfg=238 ctermbg=253
   hi StatusLineNC    ctermfg=244 ctermbg=232
   hi StorageClass    ctermfg=208
   hi Structure       ctermfg=81
   hi Tag             ctermfg=161
   hi Title           ctermfg=166
   hi Todo            ctermfg=231 ctermbg=232   cterm=bold

   hi Typedef         ctermfg=81
   hi Type            ctermfg=81                cterm=none
   hi Underlined      ctermfg=244               cterm=underline

   hi VertSplit       ctermfg=244 ctermbg=244
   hi VisualNOS                   ctermbg=238
   hi Visual                      ctermbg=235
   hi WarningMsg      ctermfg=231 ctermbg=238   cterm=bold
   hi WildMenu        ctermfg=81  ctermbg=16

   hi Normal          ctermfg=252
   hi Comment         ctermfg=246 ctermbg=236
   hi CursorLine                  ctermbg=234   cterm=none
   hi CursorColumn                ctermbg=234
   hi LineNr          ctermfg=250 ctermbg=234
   hi NonText         ctermfg=250 ctermbg=234
end

hi SyntasticError                   ctermbg=88               guibg=#870000
hi SyntasticErrorLine               ctermbg=52               guibg=#5f0000
hi SyntasticErrorSign   ctermfg=196 ctermbg=88 guifg=#ff0000 guibg=#870000
hi SyntasticWarning                 ctermbg=94               guibg=#875f00
hi SyntasticWarningLine             ctermbg=58               guibg=#5f5f00
hi SyntasticWarningSign ctermfg=220 ctermbg=94 guifg=#ffdf00 guibg=#875f00

hi link ALEError SyntasticError
hi link ALEErrorLine SyntasticErrorLine
hi link ALEErrorSign SyntasticErrorSign
hi link ALEWarning SyntasticWarning
hi link ALEWarningLine SyntasticWarningLine
hi link ALEWarningSign SyntasticWarningSign

"" Bad colors and doesn't trigger for pep8 anyways
" Actually the warningline takes priority over stylewarningline but
" the in-line stylewarning marker works as it should (the one selecting the
" column)
"hi ALEStyleWarning ctermbg=03 guibg=#808000
"hi ALEStyleWarningLine ctermbg=03 guibg=#808000
"hi link ALEStyleWarningSign ALEWarningSign

hi ALEInfo                   ctermbg=18               guibg=#000087
hi ALEInfoLine               ctermbg=17               guibg=#00005f
hi ALEInfoSign    ctermfg=21 ctermbg=18 guifg=#0000ff guibg=#000087

hi ColorColumn          ctermbg=235 guibg=#262626

" CtrlSpace:
hi CtrlSpaceSelected term=bold cterm=bold gui=bold
hi CtrlSpaceNormal ctermfg=15 guibg=#252625
hi CtrlSpaceSearch term=bold ctermfg=166 gui=bold guifg=#ef5939
hi CtrlSpaceStatus ctermfg=81 ctermbg=15 guifg=#66D9EF guibg=White


hi link Member Ignore " Any non-static member variable
"hi link Variable 
hi link EnumConstant Constant
hi clear Structure
hi link Structure Statement

hi link StructDecl Type
hi link UnionDecl Type
hi link ClassDecl Type
hi link EnumDecl Type
