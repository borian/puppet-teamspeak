class teamspeak::params {
    $init_file    = "teamspeak/init/${::osfamily}.init.erb"
    $systemd_file = 'teamspeak/systemd/teamspeak.erb'
    $version      = '3.0.12.4'
    $arch         = $::architecture
    $mirror       = 'http://teamspeak.gameserver.gamed.de/ts3/releases/<%=$version%>/teamspeak3-server_linux_<%=$download_arch%>-<%=$version%>.tar.bz2'
    $output_file  = "ts3_server_linux.tar.bz2"

    case $::osfamily {
        'Debian': {
            if $arch == 'i386' {
                $download_arch = 'x86'
            } else {
                $download_arch = $arch
            }
        }
        'RedHat': {
            if $arch == 'x86_64' {
                $download_arch = 'amd64'
            } else {
                $download_arch = 'x86'
            }
        }
        default: {
        }
    }
    if !($arch in ['i386', 'amd64', 'x86_64']) {
        fail("${arch} is not currently supported!")
    }

    if !($::osfamily in ['Debian', 'RedHat']) {
        fail("${::osfamily} is not currently supported!")
    }

}
