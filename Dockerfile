# Dockerfile
# texliveの公式イメージを使う
FROM texlive/texlive:latest

# ユーザーの追加（公式イメージではtexliveというユーザーがある）
ARG USERNAME=texlive

# 初期ディレクトリの設定
WORKDIR /work