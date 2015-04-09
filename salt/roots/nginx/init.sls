nginx:
  pkg.installed: []

  service.running:
    - enable: true
    - require:
      - pkg: nginx
    - watch:
      - file: /etc/nginx/sites-available/default

/etc/nginx/sites-available/default:
  file.managed:
    - source:
      - salt://nginx/nginx-site-config
    - replace: True
    - require:
      - pkg: nginx

/var/www/html/index.html:
  file.managed:
    - source:
      - salt://nginx/index.html
    - replace: True
    - require:
      - pkg: nginx

/var/www/html/presentation:
  file.recurse:
    - source: salt://nginx/presentation
    - user: root
    - group: root
    - require:
      - pkg: nginx

