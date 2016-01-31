FROM centos:7
MAINTAINER Yoshinori Teraoka
ENV THUMBOR_QUALUTY=100 \
    THUMBOR_ENGINE="'opencv_engine'" \
    THUMBOR_FILE_STORAGE_ROOT_PATH="'/var/cache/thumbor/source'" \
    THUMBOR_RESULT_STORAGE="'thumbor.result_storages.file_storage'" \
    THUMBOR_RESULT_STORAGE_FILE_STORAGE_ROOT_PATH="'/var/cache/thumbor/result'"
RUN yum -y update \
 && yum -y install epel-release \
 && yum -y install gcc gcc-c++ zlib-devel curl-devel libtiff-devel \
                   jasper-devel freetype-devel openjpeg-devel \
                   libpng-devel libjpeg-turbo-devel lcms2-devel \
                   GraphicsMagick-c++-devel boost-devel python-pip \
                   python-virtualenv opencv-python gifsicle libwebp-devel
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
