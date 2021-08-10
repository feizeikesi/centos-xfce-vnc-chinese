FROM consol/centos-xfce-vnc:latest
USER root

USER 0
# zh
RUN yum -y install kde-l10n-Chinese  glibc-common && \
    localedef -c -f UTF-8 -i zh_CN zh_CN.utf8 && \
    cat /dev/null > /etc/locale.conf && echo "LANG=\"zh_CN.UTF-8\"" > /etc/locale.conf && \
    source /etc/locale.conf  && \
    yum clean all  && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
ENV TZ='Asia/Shanghai'  LANG='zh_CN.UTF-8' LANGUAGE='zh_CN:cn' LC_ALL='zh_CN.UTF-8'
USER 1000
