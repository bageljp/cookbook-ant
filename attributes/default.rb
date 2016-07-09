default['ant']['version']['major'] = "1"
default['ant']['version']['minor'] = "9.4"
default['ant']['root_dir'] = "/usr/local"
default['ant']['dir'] = "apache-ant-#{node['ant']['version']['major']}.#{node['ant']['version']['minor']}"
default['ant']['source']['file'] = "#{node['ant']['dir']}-bin.tar.gz"
default['ant']['source']['url'] = "http://ftp.tsukuba.wide.ad.jp/software/apache/ant/binaries/#{node['ant']['source']['file']}"
default['ant']['user'] = "root"
default['ant']['group'] = "root"