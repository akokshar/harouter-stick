FROM registry.access.redhat.com/openshift3/ose-haproxy-router:v3.0.2.0

ADD reload-haproxy /var/lib/haproxy/reload-haproxy
ADD reload-haproxy /var/lib/haproxy/reload-haproxy

RUN chmod -R 777 /var && \
    setcap 'cap_net_bind_service=ep' /usr/sbin/haproxy
WORKDIR /var/lib/haproxy/conf

EXPOSE 80
ENV TEMPLATE_FILE=/var/lib/haproxy/conf/haproxy-config.template \
    RELOAD_SCRIPT=/var/lib/haproxy/reload-haproxy
ENTRYPOINT ["/usr/bin/openshift-router"]
