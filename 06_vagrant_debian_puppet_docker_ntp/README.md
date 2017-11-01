# 06_vagrant_debian_puppet_docker

Máquina para demostrar o provisionamento do Docker e do Ntp com o Puppet:
Nesta máquina, utilizamos os módulos puppetlabs-docker e puppetlabs-ntp para demostrar como os módulos são poderosos. 

Mais instruções nas postagens: 
[Puppet: instalação e primeiros passos - DevOps Parte 4](https://www.eunati.com.br/2017/10/puppet-instalacao-e-primeiros-passos-devops-parte-4.html)
[Gerenciamento de configuração e automação de servidores – DevOps Parte 3](https://www.eunati.com.br/2017/10/gerenciamento-de-configuracao-devops-parte-3.html)

Nesta pasta, com vagrant (versão 2.0 ou superior) e virtual box instalados, execute:
```
vagrant up
```

**Box do Vagrant:** eunati/debian-jessie64-puppet5 (Box baseado no debian/contrib-jessie64 com Puppet 5 e seguinte módulos do puppetlabs: docker, ntp, stdlib, concat, apt, vcsrepo)

**Provisionamento:** Puppet (Apache e Ntp)

**Compartilhamento:** Nenhum 

**Portas redirecionadas:** Nenhum

**Verificação do Docker:** sudo docker run hello-world

**Verificação do ntp:** ntpq -p
