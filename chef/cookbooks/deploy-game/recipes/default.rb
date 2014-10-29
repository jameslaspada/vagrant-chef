#
# Cookbook Name:: deploy-game
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

base_webapp_dir = node['tomcat']['webapp_dir']
web_service = "#{node['web']['service']['name']}#{node['web']['service']['version']}"
tomcat_home = node['tomcat']['home']

script "install-game" do
  interpreter "bash"
  user "root"
  group "root"
  cwd "/tmp"
  code <<-EOH
    wget #{node['web_app']['url']}
    mv match-game-1.0.war #{base_webapp_dir}/match-game.war
  EOH
  # notifies :restart, "service[#{web_service}]", :delayed
end

service "#{web_service}" do
  supports :status => true, :restart => true, :reload => true
  action :restart
end