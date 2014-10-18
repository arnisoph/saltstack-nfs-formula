#!jinja|yaml

{% from "nfs/defaults.yaml" import rawmap with context %}
{% set datamap = salt['grains.filter_by'](rawmap, merge=salt['pillar.get']('nfs:lookup')) %}

nfs_client:
  pkg:
    - installed
    - pkgs: {{ datamap.client.pkgs }}
