#
# Cookbook Name:: twitter-api
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

webapp = "twitter-api-php"
base_webapp_dir = node['tomcat']['webapp_dir']
web_service = "#{node['web']['service']['name']}#{node['web']['service']['version']}"

directory "#{base_webapp_dir}/#{webapp}" do
  owner "root"
  group "tomcat"
  mode "0755"
  action :create
end

# template "#{base_webapp_dir}/#{webapp}/index.html" do
#   source "index.html.erb"
#   owner "root"
#   group "tomcat"
#   mode "0644"
#   variables ({
#     :body_text => "Hello World!"
#   }
#     )
#   notifies :restart, "service[tomcat6]"
# end

cookbook_file "composer.json" do
  path "#{base_webapp_dir}/#{webapp}/composer.json"
  owner "root"
  group "root"
  mode "0644"
end

cookbook_file "TwitterAPIExchange.php" do
  path "#{base_webapp_dir}/#{webapp}/TwitterAPIExchange.php"
  owner "root"
  group "root"
  mode "0644"
end

cookbook_file "index.php" do
  path "#{base_webapp_dir}/#{webapp}/index.php"
  owner "root"
  group "root"
  mode "0644"
  notifies :restart, "service[tomcat6]"
end

service "#{web_service}" do
  supports :status => true, :restart => true, :reload => true
  action :nothing
end