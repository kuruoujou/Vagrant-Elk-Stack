kibana:
  archive.extracted:
    - name: /opt/
    - source: https://download.elasticsearch.org/kibana/kibana/kibana-4.0.1-linux-x64.tar.gz
    - source_hash: https://download.elasticsearch.org/kibana/kibana/kibana-4.0.1-linux-x64.tar.gz.sha1.txt
    - archive_format: tar
    - tar_options: xzf
    - if_missing: /opt/kibana-4.0.1-linux-x64/

  file.directory:
    - name: /opt/kibana-4.0.1-linux-x64/
    - user: root
    - group: root
    - recurse:
      - user
      - group

  service.running:
    - name: kibana4
    - require:
      - file: /etc/init.d/kibana4

kibana_init:
  file.managed:
    - name: /etc/init.d/kibana4
    - source:
      - salt://kibana/kibana4_init
    - mode: 755

  cmd.run:
    - name: update-rc.d kibana4 defaults 95 10
    - unless: ls /etc/rc5.d | grep -q kibana
    - require:
      - file: /etc/init.d/kibana4
