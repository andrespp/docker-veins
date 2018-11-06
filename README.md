docker-venis
============

Docker image for [Veins Simulator](https://veins.car2x.org/)

Veins is an open source framework for running vehicular network simulations.

It is based on two well-established simulators: OMNeT++, an event-based network simulator, and SUMO, a road traffic simulator.

It extends these to offer a comprehensive suite of models for IVC simulation.

## Usage

### Clone the repository

```console
$ git clone ...
```

### Download OMNeT++

Omnet++ links have direct link protection with captcha verification, making it not possible to directly download the installer. 

So, you need to download OMNeT++ manually from this [link](https://omnetpp.org/component/jdownloads/summary/32-release-older-versions/2325-omnetpp-5-3-linux).

After the download, you repository should look like this

```console
andre@ludwig:~/docker-veins$ ls
Dockerfile  entrypoint.sh  Makefile  omnetpp-5.3-src-linux.tgz  README.md
```

### Build Docker Image

```console
$ make setup
```

### Run

```console
$ docker run -it --rm veins bash
```

## Requirements

* Docker
* X11 with xauth


https://omnetpp.org/component/jdownloads/summary/32-release-older-versions/2325-omnetpp-5-3-linux