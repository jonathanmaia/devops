node 'desenvolvimento.eunati' {
  # Docker server deve estar sendo executado
  include 'docker'

  # Ntp deve estar sendo executado com os servidores 'a.ntp.br' e 'b.ntp.br'
  class { 'ntp':
    servers => [ 'a.ntp.br', 'b.ntp.br' ]
  }
}