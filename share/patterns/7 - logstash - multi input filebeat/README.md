# Logstash - multi input filebeat

## Syslog

edit file `/etc/rsyslog.conf`:

    # provides UDP syslog reception
    module(load="imudp")
    input(type="imudp" port="514")

Restart syslog and enable filebeat `system` module :

    systemctl restart rsyslog
    filebeat modules enable system

