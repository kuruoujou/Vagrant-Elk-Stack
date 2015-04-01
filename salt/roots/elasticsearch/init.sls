elasticsearch:
  pkgrepo.managed:
    - humanname: Elasticsearch Repository
    - name: deb http://packages.elasticsearch.org/elasticsearch/1.5/debian stable main
    - file: /etc/apt/sources.list.d/elasticsearch.list
    - keyid: D88E42B4
    - keyserver: keyserver.ubuntu.com
    - require_in:
      - pkg: elasticsearch

  pkg.installed: []

  service.running:
    - watch:
      - file: /etc/elasticsearch/elasticsearch.yml
    - require:
      - pkg: elasticsearch

  cmd.run:
    - name: update-rc.d elasticsearch defaults 95 10
    - unless: ls /etc/rc5.d | grep -q elasticsearch
    - require:
      - pkg: elasticsearch

/etc/elasticsearch/elasticsearch.yml:
  file.managed:
    - source:
      - salt://elasticsearch/elasticsearch.yml
    - replace: True
    - require:
      - pkg: elasticsearch
