default['ark']['apache_mirror'] = 'http://apache.mirrors.tds.net'
default['ark']['prefix_root'] = '/usr/local'
default['ark']['prefix_bin'] = '/usr/local/bin'
default['ark']['prefix_home'] = '/usr/local'
default['ark']['tar'] = if node['platform_family'] == 'windows'
                          "\"#{default['7-zip']['home']}\\7z.exe\""
                        else
                          '/bin/tar'
                        end

pkgs = %w(libtool autoconf) unless platform_family?('mac_os_x', 'windows')
pkgs += %w(unzip rsync make gcc) unless platform_family?('mac_os_x', 'windows')
pkgs += %w(autogen) unless platform_family?('rhel', 'fedora', 'mac_os_x', 'suse', 'windows')
pkgs += %w(gtar) if platform?('freebsd')
pkgs += %w(xz-lzma-compat) if platform?('centos')
pkgs += %w(tar) if platform_family?('rhel')

default['ark']['package_dependencies'] = pkgs
