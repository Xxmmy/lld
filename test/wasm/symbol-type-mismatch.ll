; RUN: llc -filetype=obj %s -o %t.o
; RUN: llc -filetype=obj %p/Inputs/ret32.ll -o %t.ret32.o
; RUN: not lld -flavor wasm -o %t.wasm %t.o %t.ret32.o 2>&1 | FileCheck %s

target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-unknown-wasm"

@ret32 = extern_weak global i32, align 4

; CHECK: error: symbol type mismatch: ret32
; CHECK: >>> defined as Global in {{.*}}symbol-type-mismatch.ll.tmp.o
; CHECK: >>> defined as Function in {{.*}}.ret32.o
