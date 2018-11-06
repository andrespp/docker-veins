IMAGE=veins

.PHONY: help
help:
	@echo "Usage: make [target]"
	@echo
	@echo "Targets:"
	@echo "  help\t\tPrint this help"
	@echo "  test\t\tLookup for docker and docker-compose binaries"
	@echo "  setup\t\tBuild docker images"
	@echo "  run\t\tRun app"

.PHONY: test
test:
	@which docker
	@which docker-compose
	@which xauth

.PHONY: setup
setup: Dockerfile
	docker image build -t $(IMAGE) .

.PHONY: run-omnet
run-omnet:
	@echo Running OMNet++ IDE
	docker run -it --rm -v /tmp/.X11-unix/:/tmp/.X11-unix/:ro \
	-e XAUTH=$$(xauth list|grep `uname -n` | cut -d ' ' -f5) -e "DISPLAY" \
       	$(IMAGE) omnet

.PHONY: run-bash
run-bash:
	docker run -it --rm -v /tmp/.X11-unix/:/tmp/.X11-unix/:ro \
	-v $$(pwd)/data/:/root/omnetpp-5.3/samples/ \
	-e XAUTH=$$(xauth list|grep `uname -n` | cut -d ' ' -f5) -e "DISPLAY" \
	$(IMAGE) bash

#-u $$(id -u):$$(id -g) \
