#
# Installs and configures Zabbix
# based on https://github.com/laradji/zabbix cookbook
#

packages = ["mysql", "mysql-devel"]
packages.each do |i|
  package i do
    action :install
  end
end

include_recipe "build-essential"
include_recipe "zabbix::server_common"
include_recipe "zabbix::server"
include_recipe "zabbix::web"

directory node[:zabbix][:install_dir] do
  mode '0755'
end

service "iptables" do
  action :stop
end


