require 'rails_helper'

RSpec.feature 'Welcome', type: :feature do
  scenario 'Visits root path and shows welcome message' do
    visit(root_path)
    expect(page).to have_content('Olá, seja bem-vindo(a)!')
  end
end
