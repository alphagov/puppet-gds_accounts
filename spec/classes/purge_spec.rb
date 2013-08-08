require 'spec_helper'

# Test gds_accounts::purge proxy of parent class.
describe 'gds_accounts' do
  let(:param_defaults) {{ }}
  let(:facts) {{
    :operatingsystem => 'Ubuntu',
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

  describe '#purge_ignore' do
    context 'validation' do
      let(:params) { param_defaults.merge({
        :purge_ignore => 'some_user',
      })}

      it { expect { should }.to raise_error(Puppet::Error, /is not an Array/) }
    end

    context 'defaults' do
      let(:params) { param_defaults }

      it 'should not create any user resources' do
        # https://github.com/rodjek/rspec-puppet/pull/75
        # https://github.com/rodjek/rspec-puppet/issues/98
        pending("Pending next release of rspec-puppet")
        should have_user_resource_count(0)
      end
    end

    context "['vagrant', 'vboxadd']" do
      let(:params) { param_defaults.merge({
        :purge_ignore => ['vagrant', 'vboxadd'],
      })}

      it { should contain_user('vagrant').with_ensure(nil) }
      it { should contain_user('vboxadd').with_ensure(nil) }
    end
  end
end
