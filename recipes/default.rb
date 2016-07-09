#
# Cookbook Name:: ant
# Recipe:: default
#
# Copyright 2014, bageljp
#
# All rights reserved - Do Not Redistribute
#

remote_file "/usr/local/src/#{node['ant']['source']['file']}" do
  owner "root"
  group "root"
  mode 00644
  source "#{node['ant']['source']['url']}"
end

bash "install ant" do
  user "root"
  group "root"
  cwd "/usr/local/src"
  code <<-EOC
    rm -rf #{node['ant']['dir']}
    gzip -dc #{node['ant']['source']['file']} | tar xf -
    mv #{node['ant']['dir']} #{node['ant']['root_dir']}
    cd #{node['ant']['root_dir']}
    ln -sf #{node['ant']['dir']} apache-ant
    chown #{node['ant']['user']}:#{node['ant']['group']} -R #{node['ant']['root_dir']}/#{node['ant']['dir']}
    chown #{node['ant']['user']}:#{node['ant']['group']} -h #{node['ant']['root_dir']}/apache-ant
  EOC
  not_if "ls -l #{node['ant']['root_dir']}/#{node['ant']['dir']}/bin/ant | awk '{print $3}' | grep #{node['ant']['user']}"
end

template "/etc/profile.d/ant.sh" do
  owner "root"
  group "root"
  mode 00644
end
