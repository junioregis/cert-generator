# Introduction

Generates self-signed certificates with docker.

Output formats: ```CRT```, ```KEY```, ```P12```, ```PEM```, ```DER```, ```BKS```

# Requirements

Name   | Version
-------|-----------
Docker | 18.03.0-ce

# Docker Images

Name    | Tag
--------|------
openjdk | 8-jdk

# 1. Build Image

```docker
docker build . --tag=java
```

# 2. Generate Certificates

```docker
docker run -it --rm --name java -v $(PWD)/certs:/certs java
```