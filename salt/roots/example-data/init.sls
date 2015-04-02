get-data:
  cmd.run:
    - name: wget http://rdspecialties.com/logs/access.log -O /opt/example-access.log
    - creates: /opt/example-access.log

insert-data:
  cmd.run:
    - name: cat /opt/example-access.log | nc localhost 3333
    - unless: test -d /var/lib/elasticsearch/elasticsearch/nodes/0/indices/logstash-*
    - require:
      - cmd: wget http://rdspecialties.com/logs/access.log -O /opt/example-access.log
      - service: logstash

create-dashboard:
  cmd.run:
    - name: elasticdump --input=/srv/salt/example-data/apache-kibana-dashboard.json --output=http://localhost:9200/.kibana
    - unless: test -d /var/lib/elasticsearch/elasticsearch/nodes/0/indices/.kibana
    - require:
      - npm: elasticdump
      - service: elasticsearch
