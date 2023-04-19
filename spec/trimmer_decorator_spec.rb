require_relative '../modules/decorators/trimmer_decorator'

describe TrimmerDecorator do
  before :each do
    @nameable_obj = double('nameable object')
    allow(@nameable_obj).to receive(:correct_name) { 'martin luther' }
  end

  it 'should create an instance of TrimmerDecorator' do
    td = TrimmerDecorator.new(@nameable_obj)
    expect(td).to be_instance_of TrimmerDecorator
  end

  it 'correct_name methord should return a string with 10 characters' do
    td = TrimmerDecorator.new(@nameable_obj)
    expect(td.correct_name.length).to eql 10
  end

  it 'correct_name methord should return a string martin lut' do
    td = TrimmerDecorator.new(@nameable_obj)
    expect(td.correct_name).to eql 'martin lut'
  end
end
