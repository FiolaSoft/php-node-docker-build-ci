NAME = fiolasoft/php-node-docker-build-ci
VERSION = 0.1.0

.PHONY: all php71 php72 tag_latest release

all: php71 php72

php71:
	docker build -t $(NAME)-7.1:$(VERSION) --rm -f Dockerfile-7.1 .

php72:
	docker build -t $(NAME)-7.2:$(VERSION) --rm -f Dockerfile-7.2 .

tag_latest:
	docker tag -f $(NAME):$(VERSION) $(NAME):latest

release: tag_latest
	@if ! docker images $(NAME) | awk '{ print $$2 }' | grep -q -F $(VERSION); then echo "$(NAME) version $(VERSION) is not yet built. Please run 'make build'"; false; fi
	@if ! head -n 1 Changelog.md | grep -q 'release date'; then echo 'Please note the release date in Changelog.md.' && false; fi
	docker push $(NAME)
@echo "*** Don't forget to create a tag. git tag rel-$(VERSION) && git push origin rel-$(VERSION)"