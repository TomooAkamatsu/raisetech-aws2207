require 'spec_helper'

listen_port = 3000

describe package('nginx') do
  it { should be_installed }
end

describe port(listen_port) do
  it { should be_listening }
end

# describe command('curl http://13.230.244.252:#{listen_port}/_plugin/head/ -o /dev/null -w "%{http_code}\n" -s') do
#   its(:stdout) { should match /^200$/ }
# end
