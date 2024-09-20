# calrissian-image

This repository contains the dockerfile for building a calrissian image fro EOEPCA+

The main differences from the official calrissian image: 

- uses `pip` to install `calrissian`
- uses `rockylinux:9.3-minimal` as base image
- uses a user with a group id that is not 0


