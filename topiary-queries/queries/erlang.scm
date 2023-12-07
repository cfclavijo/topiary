(module_attribute) @single_line_no_indent

(export_attribute) @single_line_no_indent

;; (export_attribute
;;  . "[" @append_space
;;  )

(pp_define) @single_line_no_indent

;; Allow blank line before
[
  (fun_decl)
  (pp_define)
  (match_expr)
  (call)
] @allow_blank_line_before

(
  [
    "="
    "->"
    ">="
    "=<"
    (binary_op_expr)
  ] @prepend_space @append_space
)

(
  [
    (match_expr)
    (case_expr)
    (call)
    (macro_call_expr)
  ]
  .
  "," @append_spaced_softline
)

;; function declaration
(fun_decl
  (function_clause
    (clause_body
      "->" @append_spaced_softline @append_indent_start
    )
  )
)

(fun_decl
  "." @append_spaced_softline @prepend_indent_end
)

;; case
(case_expr
  "of" @append_spaced_softline @append_indent_start
)
(case_expr
  "end" @prepend_spaced_softline @prepend_indent_end
)
(
  (cr_clause)
  ";" @append_spaced_softline
)

;; lists
(list "[" @append_indent_start)
(list "]" @prepend_indent_end)
(list "," @append_input_softline)

;; Expression arguments
(expr_args _ [","] @append_space)
