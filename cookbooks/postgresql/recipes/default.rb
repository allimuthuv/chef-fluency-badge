#
# Cookbook:: postgresql
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
# Install postgresql 
package 'postgresql' do
	action :install
	notifies :run, 'execute[postgresql-init]'
end

execute 'postgresql-init' do
	command 'postgresql-setup initdb'
	action  :nothing 
end

service 'postgresql' do
	action [:enable, :start]
end
