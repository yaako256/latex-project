# Dockerfile
# texliveの公式イメージを使う
FROM texlive/texlive:latest

# タイムゾーンの設定
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone

# ユーザーの追加(公式イメージではtexliveというユーザーがある)
ARG USERNAME=texlive

# 初期ディレクトリの設定
WORKDIR /work