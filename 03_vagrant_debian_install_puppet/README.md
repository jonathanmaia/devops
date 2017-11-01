# 03_vagrant_debian_install_puppet

Máquina apenas para demonstrar a instalação e um provisionamento básico com o Puppet

Mais instruções nas postagens: 
[Puppet: instalação e primeiros passos - DevOps Parte 4](https://www.eunati.com.br/2017/10/puppet-instalacao-e-primeiros-passos-devops-parte-4.html)
[Gerenciamento de configuração e automação de servidores – DevOps Parte 3](https://www.eunati.com.br/2017/10/gerenciamento-de-configuracao-devops-parte-3.html)


Nesta pasta, com vagrant (versão 2.0 ou superior, pois a 1.X não funciona corretamente com Puppet 5) e virtual box instalados, execute:
```
vagrant up
```

**Box do Vagrant:** debian/contrib-jessie64 (Debian 8 com vboxfs para funcionamento com VirtualBox)

**Provisionamento:** Shell (instalação do Puppet) e Puppet (instalação do links)

**Compartilhamento:** Sem compartilhamento

**Portas redirecionadas:** Sem porta redirecionada
