FROM quick/centosapachephp:v1
MAINTAINER Edward Quick <edwardquick@hotmail.com>
ENV MEDIAWIKI_VERSION 1.23
ENV MEDIAWIKI_FULL_VERSION 1.23.9
ENV DOCROOT /var/www/html/w
RUN yum install -y php-mysqli php-xml

# https://www.mediawiki.org/keys/keys.txt
RUN gpg --keyserver pool.sks-keyservers.net --recv-keys \
    441276E9CCD15F44F6D97D18C119E1A64D70938E \
    41B2ABE817ADD3E52BDA946F72BC1C5D23107F8A \
    162432D9E81C1C618B301EECEE1F663462D84F01 \
    1D98867E82982C8FE0ABC25F9B69B3109D3BB7B0 \
    3CEF8262806D3F0B6BA1DBDD7956EE477F901A30 \
    280DB7845A1DCAC92BB5A00A946B02565DC00AA7

RUN MEDIAWIKI_DOWNLOAD_URL="https://releases.wikimedia.org/mediawiki/$MEDIAWIKI_VERSION/mediawiki-$MEDIAWIKI_FULL_VERSION.tar.gz"; \
    set -x; \
    mkdir -p $DOCROOT \
    && curl -fSL "$MEDIAWIKI_DOWNLOAD_URL" -o mediawiki.tar.gz \
    && curl -fSL "${MEDIAWIKI_DOWNLOAD_URL}.sig" -o mediawiki.tar.gz.sig \
    && gpg --verify mediawiki.tar.gz.sig \
    && tar -xf mediawiki.tar.gz -C $DOCROOT --strip-components=1

COPY apache/mediawiki.conf /etc/httpd/conf.d
COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod -v +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/run-apache.sh"]
