; ModuleID = 'fact.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str1 = private unnamed_addr constant [6 x i8] c"a > 0\00", align 1
@.str2 = private unnamed_addr constant [7 x i8] c"fact.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1
@.str3 = private unnamed_addr constant [11 x i8] c"fact: %lu\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @foo(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !19), !dbg !20
  %2 = load i32* %1, align 4, !dbg !21
  %3 = add nsw i32 %2, 10, !dbg !21
  ret i32 %3, !dbg !21
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i64 @fact(i32 %x) #0 {
  %1 = alloca i32, align 4
  %r = alloca i64, align 8
  store i32 %x, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !22), !dbg !23
  %2 = load i32* %1, align 4, !dbg !24
  %3 = call i32 @foo(i32 %2), !dbg !24
  store i32 %3, i32* %1, align 4, !dbg !24
  call void @llvm.dbg.declare(metadata !{i64* %r}, metadata !25), !dbg !26
  %4 = load i32* %1, align 4, !dbg !26
  %5 = sext i32 %4 to i64, !dbg !26
  store i64 %5, i64* %r, align 8, !dbg !26
  br label %6, !dbg !27

; <label>:6                                       ; preds = %10, %0
  %7 = load i32* %1, align 4, !dbg !27
  %8 = add nsw i32 %7, -1, !dbg !27
  store i32 %8, i32* %1, align 4, !dbg !27
  %9 = icmp sge i32 %8, 2, !dbg !27
  br i1 %9, label %10, label %15, !dbg !27

; <label>:10                                      ; preds = %6
  %11 = load i32* %1, align 4, !dbg !28
  %12 = sext i32 %11 to i64, !dbg !28
  %13 = load i64* %r, align 8, !dbg !28
  %14 = mul nsw i64 %13, %12, !dbg !28
  store i64 %14, i64* %r, align 8, !dbg !28
  br label %6, !dbg !28

; <label>:15                                      ; preds = %6
  %16 = load i64* %r, align 8, !dbg !29
  ret i64 %16, !dbg !29
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 0, i32* %1
  call void @llvm.dbg.declare(metadata !{i32* %a}, metadata !30), !dbg !31
  call void @llvm.dbg.declare(metadata !{i32* %b}, metadata !32), !dbg !31
  call void @llvm.dbg.declare(metadata !{i32* %c}, metadata !33), !dbg !31
  store i32 7, i32* %c, align 4, !dbg !31
  br label %2, !dbg !34

; <label>:2                                       ; preds = %10, %0
  %3 = call i32 (i8*, ...)* @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0), i32* %a), !dbg !34
  %4 = icmp sgt i32 %3, 0, !dbg !34
  br i1 %4, label %5, label %14, !dbg !34

; <label>:5                                       ; preds = %2
  %6 = load i32* %a, align 4, !dbg !35
  %7 = icmp sgt i32 %6, 0, !dbg !35
  br i1 %7, label %8, label %9, !dbg !35

; <label>:8                                       ; preds = %5
  br label %10, !dbg !35

; <label>:9                                       ; preds = %5
  call void @__assert_fail(i8* getelementptr inbounds ([6 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str2, i32 0, i32 0), i32 22, i8* getelementptr inbounds ([11 x i8]* @__PRETTY_FUNCTION__.main, i32 0, i32 0)) #4, !dbg !35
  unreachable, !dbg !35

; <label>:10                                      ; preds = %8
  %11 = load i32* %a, align 4, !dbg !39
  %12 = call i64 @fact(i32 %11), !dbg !39
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str3, i32 0, i32 0), i64 %12), !dbg !39
  br label %2, !dbg !40

; <label>:14                                      ; preds = %2
  ret i32 0, !dbg !41
}

declare i32 @__isoc99_scanf(i8*, ...) #2

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #3

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!16, !17}
!llvm.ident = !{!18}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"clang version 3.4.2 (375507)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG_compile_unit ] [/home/wei/CLionProjects/Features/dg/tools/fact.c] [DW_LANG_C99]
!1 = metadata !{metadata !"fact.c", metadata !"/home/wei/CLionProjects/Features/dg/tools"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4, metadata !9, metadata !13}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"foo", metadata !"foo", metadata !"", i32 4, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @foo, null, null, metadata !2, i32 4} ; [ DW_TAG_subprogram ] [line 4] [def] [foo]
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/wei/CLionProjects/Features/dg/tools/fact.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"fact", metadata !"fact", metadata !"", i32 7, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i64 (i32)* @fact, null, null, metadata !2, i32 8} ; [ DW_TAG_subprogram ] [line 7] [def] [scope 8] [fact]
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !12, metadata !8}
!12 = metadata !{i32 786468, null, null, metadata !"long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!13 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 17, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ()* @main, null, null, metadata !2, i32 18} ; [ DW_TAG_subprogram ] [line 17] [def] [scope 18] [main]
!14 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !15, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = metadata !{metadata !8}
!16 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!17 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!18 = metadata !{metadata !"clang version 3.4.2 (375507)"}
!19 = metadata !{i32 786689, metadata !4, metadata !"x", metadata !5, i32 16777220, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 4]
!20 = metadata !{i32 4, i32 0, metadata !4, null}
!21 = metadata !{i32 5, i32 0, metadata !4, null}
!22 = metadata !{i32 786689, metadata !9, metadata !"x", metadata !5, i32 16777223, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [x] [line 7]
!23 = metadata !{i32 7, i32 0, metadata !9, null}
!24 = metadata !{i32 9, i32 0, metadata !9, null}
!25 = metadata !{i32 786688, metadata !9, metadata !"r", metadata !5, i32 10, metadata !12, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [r] [line 10]
!26 = metadata !{i32 10, i32 0, metadata !9, null}
!27 = metadata !{i32 11, i32 0, metadata !9, null}
!28 = metadata !{i32 12, i32 0, metadata !9, null}
!29 = metadata !{i32 14, i32 0, metadata !9, null}
!30 = metadata !{i32 786688, metadata !13, metadata !"a", metadata !5, i32 19, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 19]
!31 = metadata !{i32 19, i32 0, metadata !13, null}
!32 = metadata !{i32 786688, metadata !13, metadata !"b", metadata !5, i32 19, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 19]
!33 = metadata !{i32 786688, metadata !13, metadata !"c", metadata !5, i32 19, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [c] [line 19]
!34 = metadata !{i32 21, i32 0, metadata !13, null}
!35 = metadata !{i32 22, i32 0, metadata !36, null}
!36 = metadata !{i32 786443, metadata !1, metadata !37, i32 22, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/wei/CLionProjects/Features/dg/tools/fact.c]
!37 = metadata !{i32 786443, metadata !1, metadata !38, i32 22, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/wei/CLionProjects/Features/dg/tools/fact.c]
!38 = metadata !{i32 786443, metadata !1, metadata !13, i32 21, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/wei/CLionProjects/Features/dg/tools/fact.c]
!39 = metadata !{i32 23, i32 0, metadata !38, null}
!40 = metadata !{i32 24, i32 0, metadata !38, null}
!41 = metadata !{i32 26, i32 0, metadata !13, null}
