docker-veins
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
$ /entrypoint.sh omnet
```

### Import and Build Veins Project

Import the project into your OMNeT++ IDE workspace by clicking `File > Import > General: Existing Projects into Workspace` and selecting the directory `/root/veins-veins-4.7.1`.

Build the newly imported project by choosing `Project > Build All` in the OMNeT++ 5 IDE.

After the project built, you are ready to run your first IVC evaluations, but to ease debugging, the next step will ensure that SUMO works as it should.

### Make sure SUMO is working

```console
root@303866cf2f6c:~/# sumo-gui /root/veins-veins-4.7.1/examples/veins/erlangen.sumo.cfg
```

### Run the Veins demo scenario

To save you the trouble of manually running SUMO prior to every OMNeT++ simulation, the Veins module framework comes with a small python script to do that for you. In the OMNeT++ MinGW command line window, run:

```console
root@303866cf2f6c:~/# /root/veins-veins-4.7.1/sumo-launchd.py -vv -c sumo
```

In the OMNeT++ 5 IDE, simulate the Veins demo scenario by right-clicking on `veins-4.7/examples/veins/omnetpp.ini` and choosing `Run As > OMNeT++ simulation`.

Similar to the last example, this should create and start a launch configuration. You can later re-launch this configuration by clicking the green Run button in the OMNeT++ 5 IDE.

## Requirements

* Docker
* X11 with xauth

## References
* [Veins Instalation Tutorial](https://veins.car2x.org/tutorial/)