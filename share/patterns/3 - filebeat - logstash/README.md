# Logstash link

    filebeat modules disable nginx

Edit file `/etc/filebeat/filebeat.yml` :

    filebeat.inputs:
    - type: log
      enabled:true
      paths:
        - /var/log/nginx/access*.log

    #output.elasticsearch:
        # Array of hosts to connect to.
        # hosts: ["192.168.20.102:9200"]
        
    output.logstash:
        # The Logstash hosts
        hosts: ["192.168.20.102:5044"]

    systemctl restart filebeat

On logstash server, edit file `/etc/logstash/conf.d/nginx.conf` :

    input {
        beats {
            port => 5044
        }
    }

    systemctl restart logstash

Must listen on port 5044 :

    systemctl status logstash
    [main] Beats inputs: Starting input listener {:address=>"0.0.0.0:5044"}