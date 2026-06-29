# YaakoのLatex環境
## 概要
どうやらLatexすらDockerにできるらしい。  
そこで、vscodeのRemoteSSHを使って外から編集もできる論文作成環境を作ろうというプロジェクトである。

## 参考サイト
次のサイトを参考にした。  
[手軽にLatex環境を構築する with VSCode + Docker](https://zenn.dev/kneephys/articles/a1f95c4d620524)

## 使用イメージ
公式が出している次のイメージを使用している  
[https://hub.docker.com/r/texlive/texlive]


## Github設定
Githubを使って編集内容を保存できるようにする。
```bash
# git開始
git init

# 初期ブランチの変更
git branch -m main
```