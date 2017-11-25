node 'desenvolvimento.eunati' {
  # Variável com caminho do arquivo de configuração do ntp
  $file_ntp_config_file_path = '/etc/ntp.conf'

  # Atualizando apt
  exec { 'update':
    command => '/usr/bin/apt-get update'
  }

  # Pacote apache2 deve estar instalado
  package { 'apache2':
    ensure => installed,
    require => Exec['update']
  }
    
  # Serviço apache2 deve estar rodando
  service { 'apache2':
    ensure => running,
    require => Package['apache2']
  }

  # Pacote ntp deve estar instalado
  package { 'ntp':
    ensure => installed,
    require => Exec['update']
  }	

  # Arquivo de configuração do ntp deve existir
  file { 'ntp_config_file':
    path => $file_ntp_config_file_path,
    ensure => 'present',
    require => Package['ntp']
  }

  # Caso não deseje utilizar o file_name, maneira manual para configurar o ntp removendo os servidores antigos e adicionando os novos
  exec { 'ntp_config':
    command => "/bin/sed -i 's,^server,#server,g' $file_ntp_config_file_path ; /bin/echo 'server a.ntp.br\nserver b.ntp.br' >> $file_ntp_config_file_path",
    require => File['ntp_config_file'],
  	unless => "/bin/grep -q 'ntp.br' $file_ntp_config_file_path"
  }
  
  # Serviço ntpd de estar sendo executado
  service { 'ntp':
    ensure => running,
    require => [Package['ntp'], Exec['ntp_config']],
	subscribe => [Exec['ntp_config']]
  }	  
}