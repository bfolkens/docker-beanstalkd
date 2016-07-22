LOCAL_NAME=beanstalkd
VERSION=1.10
PUBLIC_NAME=docker-beanstalkd
REPOSITORY=bfolkens


.PHONY: all build tag release

all: build tag release

build:
	docker build -t $(LOCAL_NAME):$(VERSION) --rm .

tag: build
	docker tag -f $(LOCAL_NAME):$(VERSION) $(REPOSITORY)/$(PUBLIC_NAME):$(VERSION)

release: tag
	docker push $(REPOSITORY)/$(PUBLIC_NAME):$(VERSION)

