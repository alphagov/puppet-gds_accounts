require 'spec_helper'

describe 'gds_accounts::service' do
  describe 'gds_accounts::service class on RedHat' do
    let(:facts) {{
      :osfamily => 'RedHat',
    }}

    it { should contain_service('foo') }
  end

  describe 'gds_accounts::service class on Debian' do
    let(:facts) {{
      :osfamily => 'Debian',
    }}

    it { should contain_service('foo') }
  end
end

