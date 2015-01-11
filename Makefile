all: build test push

build:
	@docker \
	  build \
	  --tag=registry.mywebgrocer.com/mywebgrocer/busybox-java:jre7 ./jre7/
	@docker \
	  build \
	  --tag=registry.mywebgrocer.com/mywebgrocer/busybox-java:jdk7 ./jdk7/
	@docker \
	  build \
	  --tag=registry.mywebgrocer.com/mywebgrocer/busybox-java:jre8 ./jre8/
	@docker \
	  build \
	  --tag=registry.mywebgrocer.com/mywebgrocer/busybox-java:jdk8 ./jdk8/

test:
	@docker \
      run \
      --rm \
      --interactive \
      --tty \
      registry.mywebgrocer.com/mywebgrocer/busybox-java:jre7
	@docker \
      run \
      --rm \
      --interactive \
      --tty \
      registry.mywebgrocer.com/mywebgrocer/busybox-java:jdk7
	@docker \
      run \
      --rm \
      --interactive \
      --tty \
      registry.mywebgrocer.com/mywebgrocer/busybox-java:jre8
	@docker \
      run \
      --rm \
      --interactive \
      --tty \
      registry.mywebgrocer.com/mywebgrocer/busybox-java:jdk8

push:
	@docker \
	 push \
	 registry.mywebgrocer.com/mywebgrocer/busybox-java
