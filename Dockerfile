FROM registry.access.redhat.com/openshift3/ose-haproxy-router:v3.1.1.6

ADD reload-haproxy /var/lib/haproxy/reload-haproxy
ADD haproxy-config.template /var/lib/haproxy/conf/

#ENV container=docker \
#    PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin \
#    TEMPLATE_FILE=/var/lib/haproxy/conf/haproxy-config.template \
#    RELOAD_SCRIPT=/var/lib/haproxy/reload-haproxy

#RUN chmod -R 777 /var/lib/haproxy/reload-haproxy
#RUN chmod -R 777 /var/lib/haproxy/conf/haproxy-config.template

#RUN setcap 'cap_net_bind_service=ep' /usr/sbin/haproxy

#EXPOSE 80

#WORKDIR /var/lib/haproxy/conf

#ENTRYPOINT ["/usr/bin/openshift-router"]
