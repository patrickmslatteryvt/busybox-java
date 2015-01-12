## Minimal Docker image with Oracle Java Server JRE/JDK

A set of very minimal [Docker][1] images to run [Oracle Java][2] applications.<br>
These images use Busybox [Busybox][3] for their userland instead of Ubuntu or CentOS to keep the image size minimal (~150MB).<br>
You can contrast these images with the approx. 700MB image sizes for the [dockerfile/java][4] official Java builds.

```
REPOSITORY        TAG             VIRTUAL SIZE
busybox-java      jre7            146.9 MB
busybox-java      jdk7            148 MB
busybox-java      jre8            160.7 MB
busybox-java      jdk8            162.4 MB
dockerfile/java   openjdk-7-jre   710.1 MB
dockerfile/java   oracle-java8    755.2 MB
```

These images are inspired by / based off of original work by:<br>
https://github.com/errordeveloper/dockerfile-oracle-java<br>
https://github.com/jeanblanchard/docker-busybox-java<br>
https://github.com/progrium/busybox<br>

### FAQ
Q: Why use the Oracle JREs, why not the OpenJDK?<br>
A: The OpenJDK has a huge amount of external dependancies. The Oracle JREs on the other hand do not depend on any shared libraries and are therefore much easier to get to work on a striped bare userland such as Busybox.<br>

### Tags

* `jre7`: Oracle Java 7 (Server JRE)
* `jdk7`: Oracle Java 7 (JDK)
* `jre8`: Oracle Java 8 (Server JRE)
* `jdk8`: Oracle Java 8 (JDK)

### Usage
These images include cURL and useradd as most downstream images will need to download JARs and need to run as a non-root user.<br>

Example:
```shell
docker run --rm --interactive --tty busybox-java:jre8
```
TODO: Add link to an example downstream image using this base.

### License
MIT for the Dockerfiles and docs.

By using any of these Dockerfiles or any derived containers you are accepting the terms of the [Oracle Binary Code License Agreement for the Java SE Platform Products and JavaFX][4].
  [1]: https://www.docker.com/
  [2]: https://www.java.com/
  [3]: http://www.busybox.net/
  [4]: https://registry.hub.docker.com/u/dockerfile/java/
  [5]: http://www.oracle.com/technetwork/java/javase/terms/license/index.html
