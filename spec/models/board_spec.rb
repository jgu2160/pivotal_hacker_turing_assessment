require 'rails_helper'

RSpec.describe Board, type: :model do
  let(:valid_board) { Board.create(title: "jeff sprint")}
  let(:invalid_board) { Board.create(title: "")}

  it 'should be valid with a title' do
    expect(valid_board).to be_valid
  end

  it 'should not be valid with a title' do
    expect(invalid_board).not_to be_valid
  end
end
