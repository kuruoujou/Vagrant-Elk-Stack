logstash:
  pkgrepo.managed:
    - humanname: Logstash Repository
    - name: deb http://packages.elasticsearch.org/logstash/1.4/debian stable main
    - file: /etc/apt/sources.list.d/logstash.list
    - keyid: D88E42B4
    - keyserver: keyserver.ubuntu.com
    - require_in:
      - pkg: logstash

  pkg.installed: []

  service.running:
    - enable: True
    - require:
      - pkg: logstash
      - file: /etc/logstash/conf.d

/etc/logstash/conf.d:
  file.recurse:
    - source: salt://logstash/conf.d
    - user: root
    - group: root
    - require:
      - pkg: logstash
