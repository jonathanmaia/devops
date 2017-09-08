# 02_vagrant_eunati_apache

Máquina com Apache instalado e compartilhamento de pastas (utilizando box criada pelo próprio Vagrant).

Nesta pasta, com vagrant e virtual box instalados, execute:
```
vagrant up
```

**Box do Vagrant:** eunati/apache2 (Ubuntu Server 14.04 LTS) - Gerada manualmente

**Provisionamento:** Não necessário

**Compartilhamento:** Pasta html sicronizada em /var/www/html/hello

**Portas redirecionadas:** Porta 80 do Guest para porta 8080 do Host

**Acesso ao Apache:** http://localhost:8080/hello
