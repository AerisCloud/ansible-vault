require_relative 'spec_helper'

describe service('vault') do
	it { should be_enabled }
	it { should be_running }
end

describe file('/etc/vault.hcl') do
	it { should exist }
	it { should be_file }
	it { should be_owned_by 'vault' }
	it { should be_grouped_into 'vault' }
	it { should be_mode 640 }
end

describe file('/var/lib/vault') do
	it { should exist }
	it { should be_directory }
	it { should be_owned_by 'vault' }
	it { should be_grouped_into 'vault' }
	it { should be_mode 750 }
end

describe port(8200) do
	it { should be_listening }
end