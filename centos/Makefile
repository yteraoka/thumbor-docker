NAME=thumbor
PORT=8000
OS_DIST=centos

build:
	docker build -t thumbor-$(OS_DIST) .

run-pil:
	docker run -d -p $(PORT):8000 --name $(NAME) -e THUMBOR_ENGINE="'thumbor.engines.pil'" thumbor-$(OS_DIST)

run-pgmagick:
	docker run -d -p $(PORT):8000 --name $(NAME) -e THUMBOR_ENGINE="'graphicsmagick_engine'" thumbor-$(OS_DIST)

run-opencv:
	docker run -d -p $(PORT):8000 --name $(NAME) -e THUMBOR_ENGINE="'opencv_engine'" -e THUMBOR_DETECTORS="['thumbor.detectors.face_detector','thumbor.detectors.feature_detector']" thumbor-$(OS_DIST)

nginx-proxy:
	docker run -d -p 80:80 --name nginx-proxy -v /var/run/docker.sock:/tmp/docker.sock:ro jwilder/nginx-proxy
