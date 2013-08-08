require 'spec_helper'

# Test gds_accounts::create proxy of parent class.
describe 'gds_accounts' do
  let(:param_defaults) {{ }}
  let(:facts) {{
    :osfamily => 'Debian',
  }}

  describe '#accounts' do
    context 'validation' do
      let(:params) {{
        :accounts => 'string',
      }}

      it { expect { should }.to raise_error(Puppet::Error, /is not a Hash/) }
    end

    context 'defaults' do
      let(:params) { param_defaults }

      it 'should not create any account resources' do
        # https://github.com/rodjek/rspec-puppet/pull/75
        # https://github.com/rodjek/rspec-puppet/issues/98
        pending("Pending next release of rspec-puppet")
        should have_user_resource_count(0)
      end
    end

    context 'hash of accounts' do
      let(:params) { param_defaults.merge({
        :accounts => {
          'jane.smith' => {
            'comment' => 'Jane Smith',
          },
          'john.smith' => {
            'comment' => 'John Smith',
          },
        },
      })}

      it { should contain_user('jane.smith').with({
        :comment => 'Jane Smith',
        :groups  => ['gds'],
      })}
      it { should contain_user('john.smith').with({
        :comment => 'John Smith',
        :groups  => ['gds'],
      })}

      it { should_not contain_group('jane.smith') }
      it { should_not contain_group('john.smith') }
    end
  end

  describe '#group' do
    context 'validation' do
      let(:params) { param_defaults.merge({
        :group => ['an', 'array'],
      })}

      it { expect { should }.to raise_error(Puppet::Error, /is not a string/) }
    end

    context 'defaults' do
      let(:params) { param_defaults }
      it { should contain_group('gds').with_ensure('present') }
    end

    context 'custom group' do
      let(:params) { param_defaults.merge({
        :accounts => {
          'jane.smith' => {},
        },
        :group => 'acme',
      })}

      it { should contain_group('acme').with_ensure('present') }
      it { should contain_user('jane.smith').with({
        :groups => ['acme'],
      })}
    end
  end
end
