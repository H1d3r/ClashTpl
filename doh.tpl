{% if request.target == "clash" or request.target == "clashr" %}

port: {{ default(global.clash.http_port, "7890") }}
socks-port: {{ default(global.clash.socks_port, "7891") }}
allow-lan: {{ default(global.clash.allow_lan, "true") }}
mode: Rule
log-level: {{ default(global.clash.log_level, "info") }}
external-controller: :9090
{% if default(request.clash.dns, "") == "1" %}
dns:
  enabled: true
  listen: 1053
{% endif %}
dns:
  enabled: true
  listen: 1053
  nameserver:
   {% if default(request.doh, "false") == "true" %}
   - https://i.passcloud.xyz/dns-query
   - https://c.passcloud.xyz/dns-query
   - https://x.passcloud.xyz/dns-query
   - https://alipay.dns.nextdns.io/a69373/iMac
   {% else %}
   - 119.29.29.29
   - 223.5.5.5
   {% endif %}
  default-nameserver:
  - 119.29.29.29
  - 223.5.5.5
  - 45.90.28.205
  - 1.0.0.2
proxy-provider:
  Netease:
    type: http
    path: ./Netease.yaml
    url: "https://subcon.dlj.tf/sub?target=clash&url=https%3A%2F%2Fivapp.cn%2Fwyy.txt&emoji=true&list=true&sort=true&udp=true&tfo=false&scv=true&append_type=false&fdn=true&new_name=true&include=%E9%9F%B3%E4%B9%90"
    interval: 3600
    health-check:
      enable: true
      url: "http://www.gstatic.com/generate_204"
      interval: 300
{% if local.clash.new_field_name == "true" %}
proxies: ~
proxy-groups: ~
rules: ~
{% else %}
Proxy: ~
Proxy Group: ~
Rule: ~
{% endif %}

{% endif %}
