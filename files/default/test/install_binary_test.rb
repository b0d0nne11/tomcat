require 'minitest/spec'

describe_recipe 'tomcat::install_binary' do

  it 'creates the tomcat user and group' do
    user(node['tomcat']['user']).must_exist
    group(node['tomcat']['group']).must_exist
  end

  it 'installs tomcat via binary' do
    install_dir  = "#{node['tomcat']['install_binary']['prefix_root']}/tomcat-#{node['tomcat']['full_version']}"
    install_link = "#{node['tomcat']['install_binary']['prefix_home']}/tomcat"

    directory(install_dir).must_exist
    link(install_link).must_exist.with(
      :link_type, :symbolic).and(:to, install_dir)
  end

  it 'enables and starts the tomcat service' do
    service('tomcat').must_be_running
  end

end
