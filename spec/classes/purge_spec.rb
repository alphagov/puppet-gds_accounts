require 'spec_helper'

# Test gds_accounts::purge proxy of parent class.
describe 'gds_accounts' do
  let(:param_defaults) {{ }}
  let(:facts) {{
    :osfamily => 'Debian',
  }}

  describe '#purge' do
    context 'validation' do
      let(:params) {{
        :purge => 'string',
      }}

      it { expect { should }.to raise_error(Puppet::Error, /is not a boolean/) }
    end

    context 'defaults' do
      let(:params) { param_defaults }

      it { should contain_resources('user').with_purge(true) }
    end

    context 'true' do
      let(:params) { param_defaults.merge({
        :purge => false,
      })}

      it { should contain_resources('user').with_purge(false) }
    end
  end

  describe '#purge_min_uid' do
    context 'validation' do
      let(:params) { param_defaults.merge({
        :purge_min_uid => 'NaN',
      })}

      it { expect { should }.to raise_error(Puppet::Error, /validate_re\(\): /) }
    end

    context 'defaults' do
      let(:params) { param_defaults }

      it { should contain_resources('user').with_purge_min_uid(nil) }
    end

    context '1000' do
      let(:params) { param_defaults.merge({
        :purge_min_uid => 1000,
      })}

      it { should contain_resources('user').with_unless_system_user(1000) }
    end
  end
end
