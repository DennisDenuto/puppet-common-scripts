require 'spec_helper'
# Rename this file to classname_spec.rb
# Check other boxen modules for examples
# or read http://rspec-puppet.com/tutorial/
describe 'commonscripts' do
	let(:params) { {:username => 'bob'} }
	it do
		should contain_class('commonscripts')
		#should contain_anchor('Hello_World')
		should contain_file('/Users/bob/config')
	end
end
