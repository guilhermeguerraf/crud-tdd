require 'rails_helper'

feature 'Welcome', type: :feature do
  before(:each) { visit(root_path) }

  scenario 'Visits root path and shows welcome message' do
    expect(page).to have_content('Olá, seja bem-vindo(a)!')
  end

  scenario 'Shows a menu with a link to customers' do
    expect(find('nav > ul > li')).to have_link('Cadastro de clientes')
  end
end
