require 'rails_helper'
require 'faker'

feature 'Customers', type: :feature do
  context 'on root_path' do
    before(:each) { visit(root_path) }

    scenario { expect(page).to have_link('Cadastro de clientes') }

    scenario 'is expected to redirect to customers on click in the link "Cadastro de clientes"' do
      click_on('Cadastro de clientes')
      expect(page).to have_current_path(customers_path)
    end
  end

  context '#index' do
    before(:each) do
      create_list(:customer, 2)
      visit(customers_path)
    end

    scenario { expect(page).to have_content('Clientes') }

    scenario { expect(page).to have_link('Novo cliente') }

    scenario 'is expected to redirect to new customer on click in the link "Novo cliente"' do
      click_on('Novo cliente')
      expect(page).to have_current_path(new_customer_path)
    end

    scenario { expect(page).to have_link('Mostrar') }

    scenario { expect(page).to have_link('Editar') }

    scenario { expect(page).to have_link('Excluir') }

    scenario 'is expected to redirect to customer on click in the link "Mostrar"' do
      find(:xpath, '/html/body/main/table/tbody/tr[1]/td[3]/a').click
      expect(page).to have_content('Mostrar cliente')
    end

    scenario 'is expected to redirect to edit customer on click in the link "Editar"' do
      find(:xpath, '/html/body/main/table/tbody/tr[1]/td[4]/a').click
      expect(page).to have_content('Editar cliente')
    end
  end

  context '#new and #create' do
    before(:each) { visit(new_customer_path) }

    scenario 'Creates a valid customer' do
      fill_in('Nome',	with: Faker::Name.name)
      fill_in('Email',	with: Faker::Internet.email)
      fill_in('Telefone',	with: Faker::PhoneNumber.cell_phone)
      attach_file('Avatar',	"#{Rails.root}/spec/fixtures/avatar.png")
      choose(option: %w[S N].sample)
      click_on('Cadastrar')
      expect(page).to have_content('Cliente cadastrado com sucesso.')
    end

    scenario 'Shows error messages for invalid customer' do
      click_on('Cadastrar')
      expect(page).to have_content('não pode ficar em branco')
    end
  end

  context '#show' do
    scenario 'Show customer' do
      customer = create(:customer)
      visit(customer_path(customer.id))
      expect(page).to(
        have_content('Mostrar cliente')
        .and(have_content(customer.name))
        .and(have_content(customer.email))
        .and(have_content(customer.phone))
        .and(have_content(customer.avatar))
        .and(have_content(customer.smoker))
      )
    end
  end

  context '#edit and #update' do
    before(:each) do
      customer = create(:customer)
      visit(edit_customer_path(customer.id))
    end

    scenario { expect(page).to have_content('Editar cliente') }

    scenario 'Update a customer' do
      new_name = Faker::Name.name
      fill_in 'Nome',	with: new_name
      click_on 'Atualizar'

      expect(page).to have_content('Cliente atualizado com sucesso.')
        .and have_content(new_name)
    end
  end

  context '#destroy' do
    scenario 'Destroy a customer', js: true do
      create(:customer)
      visit(customers_path)
      click_on 'Excluir'
      1.second
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_content('Cliente excluído com sucesso.')
    end
  end
end
