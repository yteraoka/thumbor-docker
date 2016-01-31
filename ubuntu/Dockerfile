FROM ubuntu:12.04
MAINTAINER Yoshinori Teraoka
ENV THUMBOR_QUALUTY=100 \
    THUMBOR_ENGINE="'opencv_engine'" \
    THUMBOR_FILE_STORAGE_ROOT_PATH="'/var/cache/thumbor/source'" \
    THUMBOR_RESULT_STORAGE="'thumbor.result_storages.file_storage'" \
    THUMBOR_RESULT_STORAGE_FILE_STORAGE_ROOT_PATH="'/var/cache/thumbor/result'"
RUN apt-get -y update \
 && apt-get -y install libcurl4-openssl-dev python-numpy python-opencv \
      libopencv-dev libjpeg-dev libpng-dev libx264-dev libass-dev \
      libvpx1 libvpx-dev libwebp-dev webp gifsicle python-numpy \
      python-scipy cython python-virtualenv libcurl4-openssl-dev \
      libgraphicsmagick++1-dev libboost-python-dev
RUN virtualenv --system-site-packages /opt/thumbor \
 && /opt/thumbor/bin/pip install thumbor opencv-engine pgmagick graphicsmagick-engine
RUN mkdir -p /etc/thumbor /var/cache/thumbor/source /var/cache/thumbor/result
RUN groupadd thumbor && useradd -g thumbor thumbor
RUN chown -R thumbor:thumbor /etc/thumbor /var/cache/thumbor
EXPOSE 8000
COPY thumbor.sh /bin/
USER thumbor
VOLUME ["/var/cache/thumbor"]
CMD ["/bin/bash", "/bin/thumbor.sh"]
