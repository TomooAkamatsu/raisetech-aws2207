require 'spec_helper'

db_user = "admin"
db_password = "password"
db_host = "terraform-db-instance.cw7z47h4qfvy.ap-northeast-1.rds.amazonaws.com"
db_name = "raisetech_live8_sample_app_development"

describe port(3000) do
  it { should be_listening }
end

describe command('curl http://13.230.244.252:3000 -o /dev/null -w "%{http_code}\n" -s') do
  its(:stdout) { should match /^200$/ }
end

describe package('bundler') do
  it { should be_installed.by('gem').with_version('2.3.14') }
end

describe command('ruby -v') do
  its(:stdout) { should match /ruby 2\.6\.3/ }
end

describe package('rails') do
  it { should be_installed.by('gem').with_version('6.1.3.1') }
end

describe command("mysqlshow -u #{db_user} -h #{db_host} -p#{db_password} #{db_name}" ) do
    its(:stdout) { should contain("#{db_name}").from("Database:") }
end

describe package('nginx') do
  it { should be_installed }
  it { should be_installed.with_version "1.20.0" }
end

describe service('nginx') do
  it { should be_running }
end

describe package('unicorn') do
  it { should be_installed.by('gem').with_version('5.4.1') }
end

describe file('/var/www/raisetech-live8-sample-app/tmp/sockets/unicorn.sock') do
  it { should be_socket }
end
