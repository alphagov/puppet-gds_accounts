require 'spec_helper'

describe 'gds_accounts' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "gds_accounts class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should include_class('gds_accounts::params') }

        it { should contain_class('gds_accounts::install') }
        it { should contain_class('gds_accounts::config') }
        it { should contain_class('gds_accounts::service') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'gds_accounts class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
