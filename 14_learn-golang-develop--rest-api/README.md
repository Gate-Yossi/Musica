# 14_learn-golang-develop--rest-api/

## Description

GolangでRESTful APIの開発コードを管理しているディレクトリ

## Blog

- [Go言語入門：RESTful API の開発 Vol.1](https://yossi-note.com/developing_restful_api_with_golang_1/)

## Usage

```sh
cd 14_learn-golang-develop--rest-api

go run .
```

```sh
# 別ターミナルから実施
curl http://localhost:8080/albums
```

```sh
# 別ターミナルから実施
curl http://localhost:8080/albums \
    --include \
    --header "Content-Type: application/json" \
    --request "POST" \
    --data '{"id": "4","title": "The Modern Sound of Betty Carter","artist": "Betty Carter","price": 49.99}'
```

