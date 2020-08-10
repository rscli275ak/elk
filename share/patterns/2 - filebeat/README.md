# Filebeat

## Installation

Kibana : Add log data > Nginx Logs

    curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.6.1-amd64.deb
    sudo dpkg -i filebeat-7.6.1-amd64.deb

    sudo systemctl start filebeat

## Configuration

    /etc/filebeat/filebeat.yml

    setup.kibana:
        host: "192.168.20.102:5601"

    output.elasticsearch:
        hosts: ["192.168.20.102:9200"]

## Usage

    filebeat modules list
    filebeat modules enable nginx
    filebeat setup
    systemctl restart filebeat

## Test

Kibana : check indexes, patterns and discover `filebeat-*`index.