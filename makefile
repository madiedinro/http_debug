build:
	docker build -t madiedinro/httpd_debug .

buildx_amd64:
	docker buildx build --platform linux/amd64 -t madiedinro/httpd_debug .

build_linux:
	env GOOS=linux GOARCH=amd64 go build

run:
	docker build -t madiedinro/httpd_debug -f Dockerfile .
	docker run -it --rm --name=httpd_debug --hostname=httpd_debug \
		-e 'PORT=8088' \
		-p 8088:8088 \
		madiedinro/httpd_debug go run *.go

start:
	PORT=8088 go run *.go

bump-patch:
	bumpversion patch

bump-minor:
	bumpversion minor
