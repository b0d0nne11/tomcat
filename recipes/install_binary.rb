#
# Cookbook Name:: tomcat
# Recipe:: install_binary
#
# Copyright 2010, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'runit::default'

user node['tomcat']['user'] do
  system true
end

group node['tomcat']['group'] do
  members node['tomcat']['user']
end

ark 'tomcat' do
  url node['tomcat']['install_binary']['url']
  version node['tomcat']['full_version']
  owner node['tomcat']['user']
  group node['tomcat']['group']
  prefix_root node['tomcat']['install_binary']['prefix_root']
  prefix_home node['tomcat']['install_binary']['prefix_home']
  action :install
end

runit_service 'tomcat'
