#
# Cookbook:: rvm
# Attributes:: default
#
# Author:: Fletcher Nichol <fnichol@nichol.ca>
#
# Copyright:: 2010, 2011, Fletcher Nichol
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# ruby that will get installed and set to `rvm use default`.
default['rvm']['default_ruby']      = 'ruby-1.9.3-p547'
default['rvm']['user_default_ruby'] = 'ruby-1.9.3-p547'

# list of additional rubies that will be installed
default['rvm']['rubies']      = []
default['rvm']['user_rubies'] = []

# list of gems to be installed in global gemset of all rubies
global_gems = [
  { 'name' => 'bundler' },
]
default['rvm']['global_gems']       = global_gems.dup
default['rvm']['user_global_gems']  = global_gems.dup

# hash of gemsets and their list of additional gems to be installed.
default['rvm']['gems']      = {}
default['rvm']['user_gems'] = {}

# hash of rvmrc options
default['rvm']['rvmrc_env'] = { 'rvm_gem_options' => '--no-document' }

# a hash of user hashes, each an isolated per-user RVM installation
default['rvm']['installs'] = {}

# system-wide installer options
default['rvm']['installer_url'] = 'https://raw.githubusercontent.com/rvm/rvm/master/binscripts/rvm-installer'
default['rvm']['version'] = 'stable'

# GPG key for rvm verification
default['rvm']['gpg_key']        = 'D39DC0E3'
default['rvm']['gpg_key_server'] = 'hkp://keys.gnupg.net'

# Autolib mode, see https://rvm.io/rvm/autolibs
default['rvm']['autolib_mode'] = 3

# extra system-wide tunables
default['rvm']['root_path']     = '/usr/local/rvm'
default['rvm']['group_id']      = 'default'
default['rvm']['group_users']   = []

case node['platform']
when 'redhat', 'centos', 'fedora', 'scientific', 'amazon', 'oracle'
  node.override['rvm']['install_pkgs']   = %w(sed grep tar gzip bzip2 bash curl git)
when 'debian', 'ubuntu', 'suse'
  node.override['rvm']['install_pkgs']   = %w(sed grep tar gzip bzip2 bash curl git-core)
when 'gentoo'
  node.override['rvm']['install_pkgs']   = %w(git)
when 'mac_os_x', 'mac_os_x_server'
  node.override['rvm']['install_pkgs']   = %w(git)
end
