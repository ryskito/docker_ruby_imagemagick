FROM ruby:2.6.3-alpine

RUN apk --update add xz
RUN apk --update add tar
RUN apk --update add build-base
RUN image_magick_version=7.0.10-0 \
    && wget https://imagemagick.org/download/releases/ImageMagick-${image_magick_version}.tar.xz \
    && tar Jxvf ImageMagick-${image_magick_version}.tar.xz \
    && cd ImageMagick-${image_magick_version} \
    && ./configure --enable-shared --with-quantum-depth=8 --disable-hdri && make && make install \
    && rm -rf ImageMagick-${image_magick_version}*
