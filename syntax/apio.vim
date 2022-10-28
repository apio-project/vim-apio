" Vim syntax file
" Language:   APIO
" Maintainer: Nick Stogner
" Repository: https://github.com/apio-project/vim-apio
" License:   Vim

if exists('b:current_syntax')
  finish
end

syn match apioVariable /\<[A-Za-z0-9_.\[\]*]\+\>/

syn match apioParenthesis /(/
syn match apioFunction    /\w\+(/ contains=apioParenthesis

syn keyword apioKeyword for in if

syn region apioString start=/"/ end=/"/ contains=apioEscape,apioInterpolation
syn region apioString start=/<<-\?\z([A-Z]\+\)/ end=/^\s*\z1/ contains=apioEscape,apioInterpolation

syn match apioEscape /\\n/
syn match apioEscape /\\r/
syn match apioEscape /\\t/
syn match apioEscape /\\"/
syn match apioEscape /\\\\/
syn match apioEscape /\\u\x\{4\}/
syn match apioEscape /\\u\x\{8\}/

syn match apioNumber /\<\d\+\%([eE][+-]\?\d\+\)\?\>/
syn match apioNumber /\<\d*\.\d\+\%([eE][+-]\?\d\+\)\?\>/
syn match apioNumber /\<0[xX]\x\+\>/

syn keyword apioConstant true false null

syn region apioInterpolation start=/\${/ end=/}/ contained contains=apioInterpolation

syn region apioComment start=/\/\// end=/$/    contains=apioTodo
syn region apioComment start=/\#/   end=/$/    contains=apioTodo
syn region apioComment start=/\/\*/ end=/\*\// contains=apioTodo

syn match apioAttributeName /\w\+/ contained
syn match apioAttribute     /^[^:]\+:/ contains=apioAttributeName,apioComment,apioString

syn match apioBlockName /\w\+/ contained
syn match apioBlock     /^[^:]\+{/ contains=apioBlockName,apioComment,apioString

syn keyword apioTodo TODO FIXME XXX DEBUG NOTE contained

hi def link apioVariable      PreProc
hi def link apioFunction      Function
hi def link apioKeyword       Keyword
hi def link apioString        String
hi def link apioEscape        Special
hi def link apioNumber        Number
hi def link apioConstant      Constant
hi def link apioInterpolation PreProc
hi def link apioComment       Comment
hi def link apioTodo          Todo
hi def link apioBlockName     Structure

let b:current_syntax = 'apio'
