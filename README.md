# Customers CRUD App
## Sobre
O projeto é uma aplicação básica de cadastro de clientes desenvolvida seguindo o fluxo do TDD.

## Tecnologias utilizadas
- [Ruby](https://www.ruby-lang.org/pt/) (2.5.0)
- [Rails](https://rubyonrails.org/) (5.2.8.1)
- [SQLite3](http://www.sqlite.org) (3.37.2)

## Ferramentas de teste
- [RSpec](https://github.com/rspec/rspec-rails) (3.9.1)
- [Capybara](https://github.com/teamcapybara/capybara) (3.35.3)
- [FactoryBot](https://github.com/thoughtbot/factory_bot_rails) (4.11.1)
- [Faker](https://github.com/faker-ruby/faker) (2.22.0)

## Instruções para uso
Clone o projeto em sua máquina e instale as dependências do projeto com os comandos:
```bash
yarn
bundle
```

Logo após, crie o banco de dados com:
```bash
rails db:create:all
rails db:migrate
```
Levante e rode a aplicação com:
```bash
rails s
```
E, finalmente, acesse ```http://localhost:3000``` no seu navegador.

## Como rodar a suíte de teste
Para rodar os testes escritos, rode no seu terminal:
```bash
bin/rspec spec/features/
```
