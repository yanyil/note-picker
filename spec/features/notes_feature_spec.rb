require 'rails_helper'

feature 'notes' do
  context 'no notes have been selected' do
    scenario 'should display a prompt to add notes' do
      visit '/notes'
      expect(page).to have_content 'No notes have been selected yet'
      expect(page).to have_link 'Add notes'
    end
  end

  context 'notes have been selected' do
    before do
      Note.create(name: 'C')
    end

    scenario 'display notes' do
      visit '/notes'
      expect(page).to have_content('C')
      expect(page).not_to have_content('No notes have been selected yet')
    end
  end
end