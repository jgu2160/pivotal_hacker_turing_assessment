require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:valid_ticket) { Ticket.create(title: "jeff ticket")}
  let(:invalid_ticket) { Ticket.create(title: "")}

  it 'should be valid with a title' do
    expect(valid_ticket).to be_valid
  end

  it 'should default to backlog' do
    expect(valid_ticket.status).to eq('backlog')
  end

  it 'should not be valid with a title' do
    expect(invalid_ticket).not_to be_valid
  end
end
