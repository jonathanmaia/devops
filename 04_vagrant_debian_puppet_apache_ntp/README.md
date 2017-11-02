# 04_vagrant_debian_puppet_apache_ntp

Máquina para demostrar o provisionamento do Apache e do Ntp com o Puppet:
Nesta máquina, utilizamos o mínimo possível de módulos do Puppet, demonstrando como garantir a idempotência. 

Mais instruções nas postagens: 

[Puppet: instalação e fundamentos - DevOps Parte 4](https://www.eunati.com.br/2017/10/puppet-instalacao-e-fundamentos-devops-parte-4.html)

[Gerenciamento de configuração e automação de servidores – DevOps Parte 3](https://www.eunati.com.br/2017/10/gerenciamento-de-configuracao-devops-parte-3.html)

Nesta pasta, com vagrant (versão 2.0 ou superior) e virtual box instalados, execute:
```
vagrant up
```

**Box do Vagrant:**[eunati/debian-jessie64-puppet5](https://app.vagrantup.com/eunati/boxes/debian-jessie64-puppet5) (Box baseado no debian/contrib-jessie64 com Puppet 5 e seguinte módulos do puppetlabs: docker, ntp, stdlib, concat, apt, vcsrepo)

**Provisionamento:** Puppet (Apache e Ntp)

**Compartilhamento:** Pasta html sicronizada em /var/www/html/hello

**Portas redirecionadas:** Porta 80 do Guest para porta 8080 do Host

**Acesso ao Apache:** http://localhost:8080/hello

**Verificação do ntp:** ntpq -p
