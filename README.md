Proyecto MTG
============

 * Ruby 1.9.3
 * Rails 3.2.12

## Ambiente de trabajo básico

1. Instalar bibliotecas de openssl y readline.
1. Instalar nodejs o similar en tu sistema operativo
1. Instalar RVM desde https://rvm.io/
1. Instalar Ruby 1.9.3 y setear RVM para utilizarlo por defecto
 * rvm install 1.9.3
 * rvm use --default 1.9.3
1. Instalar bundler con: gem install bundler
1. En directorio del proyecto ejecutar: bundle install
1. rake db:migrate
1. Utilizar doc/gatecrash.csv como ejemplo para poblar la base de datos de cartas.

## Branches

* smorales-CardScaffold (mergida al master), contiene trabajos premilinares del modelo Card.
