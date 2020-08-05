
SHELL = /bin/bash

package:
	docker build --tag lambda:latest .
	docker run --name lambda --volume $(shell pwd)/:/local -itd lambda:latest bash
	docker cp lambda:/tmp/package.zip package.zip
	docker stop lambda
	docker rm lambda
