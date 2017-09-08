# 01_vagrant_ubuntu_apache

Máquina com Apache instalado e compartilhamento de pastas.

Mais instruções na postagem: [Vagrant: Turbine suas VMs e ambientes de desenvolvimento – DevOps Parte 1](http://www.eunati.com.br/2017/08/vagrant-turbine-suas-vms-e-ambientes-de-desenvolvimento-devops-parte-1.html)

Nesta pasta, com vagrant e virtual box instalados, execute:
```
vagrant up
```

**Box do Vagrant:** ubuntu/trusty64 (Ubuntu Server 14.04 LTS)

**Provisionamento:** Apenas Shell (instalação do Apache)

**Compartilhamento:** Pasta html sicronizada em /var/www/html/hello

**Portas redirecionadas:** Porta 80 do Guest para porta 8080 do Host

**Acesso ao Apache:** http://localhost:8080/hello
