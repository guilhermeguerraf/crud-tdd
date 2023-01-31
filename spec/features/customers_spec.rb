require 'rails_helper'

feature 'Customers', type: :feature do
  scenario 'Verify if welcome page contains link to customers' do
    visit(root_path)
    expect(page).to have_link('Cadastro de clientes')
  end

  scenario 'Verify if link redirect to customers' do
    visit(root_path)
    click_on('Cadastro de clientes')
    expect(page).to have_current_path(customers_path)
  end

  scenario 'Shows the header of the page' do
    visit(customers_path)
    expect(page).to have_content('Listando clientes')
  end

  scenario 'Shows a link to new customer' do
    visit(customers_path)
    expect(page).to have_link('Novo cliente')
  end

  scenario 'Shows a link redirect to new customer' do
    visit(customers_path)
    click_on('Novo cliente')
    expect(page).to have_current_path(new_customer_path)
  end
end
