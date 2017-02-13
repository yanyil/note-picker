require 'rails_helper'

feature 'notes' do
  context 'no notes have been added' do
    scenario 'should display a prompt to add notes' do
      visit '/notes'
      expect(page).to have_content 'No notes have been added yet'
      expect(page).to have_link 'Add notes'
    end
  end

  context 'notes have been added' do
    before do
      Note.create(name: 'C')
    end

    scenario 'display notes' do
      visit '/notes'
      expect(page).to have_content('C')
      expect(page).not_to have_content('No notes have been added yet')
    end
  end

  context 'adding notes' do
    scenario 'prompts user to select notes, then displays the new notes' do
      visit '/notes'
      click_link 'Add notes'
      select 'C'
      click_button 'Add notes'
      expect(page).to have_content 'C'
      expect(current_path).to eq '/notes'
    end
  end
end