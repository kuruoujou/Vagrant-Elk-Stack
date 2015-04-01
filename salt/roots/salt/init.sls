/etc/salt/minion:
  file.managed:
    - source:
      - salt://salt/minion_config
    - replace: True
