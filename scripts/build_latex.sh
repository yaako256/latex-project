#!/bin/sh
# settings.jsonでlatexのbuildを補助するためのスクリプト

# latexのビルド
latexmk \
    -cd \
    -auxdir=trash \
    -outdir=. \
    -synctex=1 \
    -interaction=nonstopmode \
    -file-line-error \
    "$1"

# 実行場所移動
cd "$(dirname "$1")"

# trashフォルダに入らないものを移動
mv -f *.dvi trash/ 2>/dev/null || true
mv -f *.synctex.gz trash/ 2>/dev/null || true