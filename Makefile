build:
	cd v$(VERSION); \
	docker build . -t shiny-server:v$(VERSION)
