# Kafka

C'est un bus, une queue de messages., organisés par topic.

Fait office de tampon : permet de conserver les messages le temps que logstash les traite.

## Run

Lancer les conteneurs kafka DB servers sur la machine hôte :

    docker-compose up -d

## Test

    docker run --net=host --rm confluentinc/cp-kafka:latest kafka-topics --bootstrap-server 192.168.20.104:19092 --list
    
    kafkacat -C -b 192.168.20.104:19092 -t filebeat

    docker run --net=host --rm confluentinc/cp-kafka:latest kafka-topics --bootstrap-server 192.168.20.104:19092 --topic filebeat --delete
