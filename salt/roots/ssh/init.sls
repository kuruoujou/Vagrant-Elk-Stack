openssh-server:
  pkg.installed: []
  service.running:
    - name: ssh
    - enable: True
    - require:
      - pkg: openssh-server
