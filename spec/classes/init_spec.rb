require 'spec_helper'

describe 'gds_accounts' do
  context 'supported operating systems' do
    %w{Ubuntu}.each do |os|
      describe "gds_accounts class without any parameters on #{os}" do
        let(:params) {{ }}
        let(:facts) {{
          :operatingsystem => os,
        }}

        it { should contain_anchor('gds_accounts::begin') }
        it { should contain_class('gds_accounts::create') }
        it { should contain_anchor('gds_accounts::end') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'updatemotd class without any parameters on RedHat/CentOS' do
      let(:facts) {{
        :operatingsystem => 'CentOS',
      }}

      it { expect { should }.to raise_error(Puppet::Error, /CentOS not supported/) }
    end
  end
end
