# ===== コンパイラ設定 =====

# コンパイラ指定
# 配布テンプレートがplatexなので現在はそっちを使用
$latex = 'platex %O %S';
#$latex = 'uplatex %O %S';

# DVIからPDFへ変換
$dvipdf = 'dvipdfmx %O -o %D %S';

# PDF生成モード（DVI → PDF）
$pdf_mode = 3;

# ===== 文献処理 =====

# BibLaTeX用の文献処理ツール
$bibtex = 'biber %O %S';