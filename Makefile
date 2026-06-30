# makefile
# ==========================================
### メイン
# ==========================================
.PHONY: up stop down no-cache ps shell

## コンテナ起動
up:
	docker compose up

## キャッシュも消してコンテナを作り直す
up-clean:
	docker compose build --no-cache
	docker compose up --force-recreate

## コンテナ停止
stop:
	docker compose stop

## コンテナdown
down:
	docker compose down

## 起動中のコンテナを確認
ps:
	docker compose ps

## コンテナに入る
shell:
	docker compose exec latex bash


# ==================================
### その他 (Utilities)
# ==================================
.PHONY: chown help

## カレントディレクトリ内の全ファイルに権限の付与
chown:
	sudo chown -R $(shell whoami):$(shell whoami) .

## このMakefileのヘルプメッセージを表示
# `#`が3つのものを検知し、グループ名として表示
# `#`が2つのものを検知し、そのあとのkeyと組み合わせることでhelpとして表示
help:
	@awk '/^### / {print ""; printf "\033[1;35m%s\033[0m\n", substr($$0, 5); next} /^## / {desc=substr($$0, 4)} /^[a-zA-Z_-]+:/ {if (desc) {sub(/:.*/, "", $$1); printf "  \033[36m%-15s\033[0m %s\n", $$1, desc; desc=""}}' $(MAKEFILE_LIST)

