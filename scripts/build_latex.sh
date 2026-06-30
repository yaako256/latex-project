#!/bin/sh
# build_latex.sh
# settings.jsonでlatexのbuildをする時の補助スクリプト

# エラー時に強制終了させる
set -e

# $1が未指定の時のエラーハンドリング(予防)
[ -z "$1" ] && { echo "Usage: $0 <target.tex>" >&2; exit 1; }

# 使用文字列を予め定数化
target_dir=$(dirname "$1")
target_base=$(basename "$1" .tex)
aux_dir=".latexmk-cache"

# latexのビルド
#
# 各パラメータ:
#   -cd: 対象ファイルのフォルダをカレントディレクトリとする
#   -auxdir: 補助ファイル(.log/.aux等)の出力先指定
#   -outdir: PDF等の出力先指定
#   -synctex: SyncTeXを有効化(エディタ⇔PDF間のジャンプに使用)
#   -interaction=nonstopmode: エラー時に停止せず処理を継続
#   -file-line-error: エラーをファイル名:行番号形式で出力
#   "S1": 対象texの指定(shの引数として渡す)
latexmk \
    -cd \
    -auxdir="$aux_dir" \
    -outdir=. \
    -synctex=1 \
    -interaction=nonstopmode \
    -file-line-error \
    "$1"

# カレントディレクトリを文書フォルダへ移動
cd "$target_dir"

# auxdir="$aux_dir" で出力された補助ファイル一式を削除
rm -rf "$aux_dir"

# outdir直下に残るビルド副産物を削除(対象ファイル名に紐づくものだけ)
rm -f -- "$target_base.dvi"
rm -f -- "$target_base.synctex.gz"