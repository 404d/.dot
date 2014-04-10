if !has('conceal')
    finish
endif

syntax clear pythonOperator

syntax match pythonOperator "\<is\>"
syntax match pyNiceOperator "\<in\>" conceal cchar=∈
syntax match pyNiceOperator "\<or\>" conceal cchar=∨
syntax match pyNiceOperator "\<and\>" conceal cchar=∧
syntax match pyNiceOperator "\%(is \)\@<!\<not\%( \|\>\)" conceal cchar=¬
syntax match pyNiceOperator "\<not in\>" conceal cchar=∉
syntax match pyNiceOperator "<=" conceal cchar=≤
syntax match pyNiceOperator ">=" conceal cchar=≥
syntax match pyNiceOperator "=\@<!===\@!" conceal cchar=≡
syntax match pyNiceOperator "!=" conceal cchar=≢
syntax keyword pyNiceOperator sum conceal cchar=∑
syntax match pyNiceOperator "\<\%(math\.\)\?sqrt\>" conceal cchar=√
syntax match pyNiceKeyword "\<\%(math\.\)\?pi\>" conceal cchar=π

syntax match pyNiceOperator "trigger=" conceal cchar=⥅
syntax match pyNiceOperator "event=" conceal cchar=⥴
syntax keyword pyNiceStatement lambda conceal cchar=λ

syntax keyword pyNiceBuiltin any conceal cchar=∃
syntax keyword pyNiceBuiltin all conceal cchar=∀

hi link pyNiceOperator Operator
hi link pyNiceStatement Statement
hi link pyNiceKeyword Keyword
hi link pyNiceBuiltin Builtin
hi! link Conceal Operator

setlocal conceallevel=2
