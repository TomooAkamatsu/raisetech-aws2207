require 'spec_helper'

db_user = "admin"
db_password = "password"
db_host = "terraform-db-instance.cw7z47h4qfvy.ap-northeast-1.rds.amazonaws.com"
db_name = "raisetech_live8_sample_app_development"

#3000番ポートが空いているか
describe port(3000) do
  it { should be_listening }
end

#ステータスが200で返ってくるか
describe command('curl http://13.230.244.252:3000 -o /dev/null -w "%{http_code}\n" -s') do
  its(:stdout) { should match /^200$/ }
end

#bundlerのバージョンが2.3.14でインストールされているか
describe package('bundler') do
  it { should be_installed.by('gem').with_version('2.3.14') }
end

#rubyのバージョンが2.6.3か
describe command('ruby -v') do
  its(:stdout) { should match /ruby 2\.6\.3/ }
end

#railsのバージョンが6.1.3.1でインストールされているか
describe package('rails') do
  it { should be_installed.by('gem').with_version('6.1.3.1') }
end

#RDS上にデータベースが作成されているか
describe command("mysqlshow -u #{db_user} -h #{db_host} -p#{db_password} #{db_name}" ) do
    its(:stdout) { should contain("#{db_name}").from("Database:") }
end

#nginxのバージョンが1.20.0でインストールされているか
describe package('nginx') do
  it { should be_installed }
  it { should be_installed.with_version "1.20.0" }
end

#nginxが動いているか
describe service('nginx') do
  it { should be_running }
end

#unicornのバージョンが5.4.1でインストールされているか
describe package('unicorn') do
  it { should be_installed.by('gem').with_version('5.4.1') }
end

#unicornのソケットが指定の場所にあるか
describe file('/var/www/raisetech-live8-sample-app/tmp/sockets/unicorn.sock') do
  it { should be_socket }
end
