require_relative '../modules/rental'
describe Rental do
  before :each do
    @book = double('book object')
    allow(@book).to receive(:rentals) { [] }
    allow(@book).to receive(:title) { 'Sample Book' }

    @person = double('person object')
    allow(@person).to receive(:rentals) { [] }
    allow(@person).to receive(:id) { 1000 }
  end

  it 'should create an instance of Rental class' do
    rentl = Rental.new('2023-04-20', @person, @book)
    expect(rentl).to be_instance_of Rental
  end
  it 'to_json should return a non nil json object' do
    rentl = Rental.new('2023-04-20', @person, @book)
    expect(rentl.to_json).not_to be_nil
  end
end
