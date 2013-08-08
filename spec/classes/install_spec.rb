require 'spec_helper'

describe 'gds_accounts::install' do
  describe 'gds_accounts::install class on RedHat' do
    let(:facts) {{
      :osfamily => 'RedHat',
    }}

    it { should contain_package('foo') }
  end

  describe 'gds_accounts::install class on Debian' do
    let(:facts) {{
      :osfamily => 'Debian',
    }}

    it { should contain_package('foo') }
  end
end
