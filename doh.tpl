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
  - https://i.passcloud.xyz/dns-query
  - https://c.passcloud.xyz/dns-query
  - https://x.passcloud.xyz/dns-query
  - https://alipay.dns.nextdns.io/a69373/iMac

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
