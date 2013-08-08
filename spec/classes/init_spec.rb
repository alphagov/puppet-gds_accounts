require 'spec_helper'

describe 'gds_accounts' do
  context 'supported operating systems' do
    %w{Debian}.each do |osfamily|
      describe "gds_accounts class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should include_class('gds_accounts::params') }

        it { should contain_anchor('gds_accounts::begin') }
        it { should contain_anchor('gds_accounts::end') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'updatemotd class without any parameters on RedHat/CentOS' do
      let(:facts) {{
        :osfamily        => 'RedHat',
        :operatingsystem => 'CentOS',
      }}

      it { expect { should }.to raise_error(Puppet::Error, /CentOS not supported/) }
    end
  end
end
