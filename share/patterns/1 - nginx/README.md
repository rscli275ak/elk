## TP - nginx

        sudo apt install -y nginx
        sudo usermod -aG adm logstash
        sudo systemctl restart nginx
        curl localhost
        less /var/log/nginx/acces.log
        ps aux | grep nginx
        sudo chown -R www-data:adm /var/log/nginx
        sudo systemctl restart nginx

Logstash nécessite des droits de lecture sur le groupe `adm`.

        mkdir /etc/logstash/pattern
        chmod -R 755 /etc/logstash/pattern/

Kibana : Management > Elasticsearch > Index Management : l'index doit apparaître. Sinon vérifier les droits et les appartenances des apps aux groupes.

Créer le pattern sous kibana à partir de l'index.