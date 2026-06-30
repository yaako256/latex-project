# YaakoのLaTex環境

[![Docker](https://img.shields.io/badge/docker-compose-blue.svg)](https://www.docker.com/)
[![LaTeX](https://img.shields.io/badge/LaTeX-TeXLive-008080.svg?logo=latex)](https://www.latex-project.org/)

## 概要
どうやらLaTexすらDockerにできるらしい。  
そこで、VSCodeでRemoteSSHを使って外から編集もできるような文書作成環境を作ろうというプロジェクトである。  
VSCodeの拡張機能である`LaTeX Workshop`を使った、プレビューも表示しながら文書作成ができる、ストレスフリーな環境を目標にした。

---
## クイックスタート
DockerとMakeがインストールされている環境であれば、以下のステップで簡単にLaTexでの文書作成ができる。  

### 前提条件
- Docker / Docker Compose
- Make
- VS Code + LaTeX Workshop拡張機能

### 1. コンテナのビルドと常駐化
プロジェクトのルートディレクトリで以下のコマンドを実行する。
```bash
make up
```
このコマンドにより、内部で `docker compose up` が走り、LaTexビルド用コンテナが起動される。

### 2. 文書作成開始
srcフォルダに新規フォルダを追加し、文書作成を開始できる。  
どのように作っても良いが、bashで作る場合を示す。
```bash
# srcフォルダに移動
cd src

# 新規フォルダ作成
mkdir new_thesis

# 新規フォルダに移動
cd new_thesis

# 新しいLaTexファイル作成
touch main.tex
```

### 3. 設定ファイル
文書作成時、設定ファイルを使うことがある。  
それを文書ファイルと同じ位置に持ってくる。  
configフォルダに保管しておき、欲しいテンプレートを文書フォルダにコピペするのが良いだろう。
```bash
# 例: example.clsとexample.styをコピー
cp config/example.cls config/example.sty src/new_thesis/
```
以下に文書フォルダのファイル構造例を示す。
```
new_thesis/
├── example.cls
├── example.sty
└── main.tex
```

---
## 参考サイト
次のサイトを参考にした。  
[手軽にLatex環境を構築する with VSCode + Docker](https://zenn.dev/kneephys/articles/a1f95c4d620524)

---
## 使用イメージ
公式が出している次のイメージを使用している  
[texlive/texlive](https://hub.docker.com/r/texlive/texlive)


---
## 全体のファイル構造について
全体はこのようなファイル構造をしている(一部不必須ファイルは除く)。  
```
latex-project/
├── .latexmkrc # LaTexのビルド設定
├── Makefile
├── Dockerfile
├── compose.yaml
├── .vscode/ # editor設定
│   └── settings.json # 拡張機能LaTeX Workshopを使ったビルドの設定がされている
├── scripts/
│   └── build_latex.sh # LaTexビルド補助用sh
├── config/ # 設定ファイルの保管用(使用時は各フォルダにコピペする)
│   ├── aaa.cls
│   ├── bbb.sty
│   └── ccc.bst
└── src/ # 文書作成環境
    └── _latex_test/ # サンプル文書作成フォルダ
        ├── test.pdf # 出力pdf
        └── test.tex # サンプルLaTex
```

---
## カスタマイズ
`LaTeX Workshop`が提供しているtex/pdf間のジャンプ機能を使いたい場合は、`build_latex.sh`の次の行をコメントアウトして、`synctex.gz`ファイルを残すと良い。
```sh
# rm -f -- "$target_base.synctex.gz"
```