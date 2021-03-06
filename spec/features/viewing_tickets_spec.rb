require 'spec_helper'

feature 'Viewing tickets'do
  before do
    textmate_2 = FactoryGirl.create(:project, name: 'Textmate 2')

    FactoryGirl.create(:ticket, project: textmate_2, title: 'Make it shiny', description: 'Gradients oh my!')

    internet_explorer = FactoryGirl.create(:project, name: 'Internet Explorer')

    FactoryGirl.create(:ticket, project: internet_explorer, title: 'Standards Compliance', description: 'Isn\'t a joke')

    visit '/'
  end

  scenario 'Viewing tickets for a given for a given project' do
    click_link "Textmate 2"

    expect(page).to have_content('Make it shiny')
    expect(page).to_not have_content('Standards Compliance')

    click_link 'Make it shiny'
    within('#ticket h2') do
      expect(page).to have_content('Make it shiny')
    end

    expect(page).to have_content('Gradients oh my!')
  end
end



