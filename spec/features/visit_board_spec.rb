require 'rails_helper'

RSpec.describe "visiting the board", type: :feature do

  it 'should have a create page' do
    visit new_board_path
    expect(page).to have_content("Create a new board!")
  end

  it 'should have a create page' do
    Board.create(title: "jeff sprint")
    visit boards_path
    expect(page).to have_content("jeff sprint")
  end

  it 'should create a board' do
    visit new_board_path
    fill_in "board_title", with: "jeff board"
    click_link_or_button "Submit"
    expect(current_path).to eq(boards_path)
  end

  context 'when on show page' do
    before :each do
      board = Board.create(title: "jeff sprint")
      Ticket.create(title: "jeffrey", board_id: board.id)
      visit board_path(board)
    end

    it 'should have a create form for tickets' do
      expect(page).to have_content("Create new ticket")
    end

    it 'should have a list of tickets' do
      expect(page).to have_content("jeffrey")
      expect(page).to have_content("status: backlog")
    end
  end
end
