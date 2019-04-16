require 'features_helper'

RSpec.describe 'List books' do
  it 'displays each book on the page' do
    repository = BookRepository.new

    repository.create(title: 'PoEAA', author: 'Martin Fowler')
    repository.create(title: 'TDD',   author: 'Kent Beck')

    visit '/books'

    within '#books' do
      expect(page).to have_selector('.book', count: 2), 'Expected to find 2 books'
    end
  end
end
