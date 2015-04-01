/etc/apt/apt.conf.d/99force-ipv4:
  file.managed:
    - replace: True
    - contents: |
        # Force the use of apt over ipv4 due to speed concerns on ipv6.
        Acquire::ForceIPv4 "True";

python-software-properties:
  pkg.installed: []

python-apt:
  pkg.installed: []

npm:
  pkg.installed: []

nodejs-legacy:
  pkg.installed: []
