#
# Cookbook Name:: hello-world
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
webapp = "hello-world"
base_webapp_dir = node['tomcat']['webapp_dir']
web_service = "#{node['web']['service']['name']}#{node['web']['service']['version']}"

directory "#{base_webapp_dir}/#{webapp}" do
  owner "root"
  group "tomcat"
  mode "0755"
  action :create
end

template "#{base_webapp_dir}/#{webapp}/index.html" do
  source "index.html.erb"
  owner "root"
  group "tomcat"
  mode "0644"
  variables ({
    :body_text => "Hello World!"
  }
    )
  notifies :restart, "service[tomcat6]"
end

service "#{web_service}" do
  supports :status => true, :restart => true, :reload => true
  action :nothing
end

