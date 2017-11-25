node 'desenvolvimento.eunati' {
  # Variável com caminho do arquivo de configuração do ntp
  $file_ntp_config_file_path = '/etc/ntp.conf'

  # Atualizando apt
  exec { 'update':
    command => '/usr/bin/apt-get update'
  }

  # Pacote apache2 deve estar instalado 
  package { 'apache2':
    ensure  => installed,
    require => Exec['update']
  }
    
  # Serviço apache2 deve estar rodando
  service { 'apache2':
    ensure  => running,
    require => Package['apache2']
  }

  # Pacote ntp deve estar instalado
  package { 'ntp':
    ensure  => installed,
    require => Exec['update']
  }	

  # Arquivo de configuração do ntp deve existir
  file { 'ntp_config_file':
    path    => $file_ntp_config_file_path,
    ensure  => 'present',
    require => Package['ntp']
  }

  # Removendo os servidores possivelmente configurados no ntp (começam a linha com server)
  file_line { 'ntp_config_remove_server':
    ensure            => absent,
    path              => $file_ntp_config_file_path,
    line              => '#server',
    match             => '^server',
	match_for_absence => true,
	multiple          => true,
	replace           => false,
	require           => File['ntp_config_file'],
  }  

  # Adicionando servidor a.ntp.br 
  file_line { 'ntp_config_add_server1':
    path               => $file_ntp_config_file_path,
    line               => 'server a.ntp.br',
	require            => File_line['ntp_config_remove_server']
  }  

  # Adicionando servidor b.ntp.br 
  file_line { 'ntp_config_add_server2':
    path               => $file_ntp_config_file_path,
    line               => 'server b.ntp.br',
	require            => File_line['ntp_config_remove_server']
  }  
  
  # Serviço ntpd de estar sendo executado
  service { 'ntp':
    ensure    => running,
    require   => [ Package['ntp'], File_line['ntp_config_remove_server'], File_line['ntp_config_add_server1'], File_line['ntp_config_add_server2']],
	subscribe => [ File_line['ntp_config_add_server1'], File_line['ntp_config_add_server2']]
  }	  
}