USER = registry.mywebgrocer.com/mywebgrocer

all: build test push

clean:
	@docker rmi $(USER)/busybox-java:jre7
	@docker rmi $(USER)/busybox-java:jdk7
	@docker rmi $(USER)/busybox-java:jre8
	@docker rmi $(USER)/busybox-java:jdk8
	
build:
	@docker \
		build \
		--tag=$(USER)/busybox-java:jre7 ./jre7/
	@docker \
		build \
		--tag=$(USER)/busybox-java:jdk7 ./jdk7/
	@docker \
		build \
		--tag=$(USER)/busybox-java:jre8 ./jre8/
	@docker \
		build \
		--tag=$(USER)/busybox-java:jdk8 ./jdk8/

test:
	@docker \
		run \
		--rm \
		--interactive \
		--tty \
		$(USER)/busybox-java:jre7
	@docker \
		run \
		--rm \
		--interactive \
		--tty \
		$(USER)/busybox-java:jdk7
	@docker \
		run \
		--rm \
		--interactive \
		--tty \
		$(USER)/busybox-java:jre8
	@docker \
		run \
		--rm \
		--interactive \
		--tty \
		$(USER)/busybox-java:jdk8

push:
	@docker \
		push \
		$(USER)/busybox-java
