require_relative '../modules/decorators/capitalize_decorator'

describe CapitalizeDecorator do
  before :each do
    @nameable_obj = double('nameable object')
    allow(@nameable_obj).to receive(:correct_name) { 'martin luther' }
  end

  it 'should create an instance of CapitalizeDecorator' do
    cd = CapitalizeDecorator.new(@nameable_obj)
    expect(cd).to be_instance_of CapitalizeDecorator
  end
  it 'should create instance of type BaseDecorator' do
    cd = CapitalizeDecorator.new(@nameable_obj)
    expect(cd).to be_kind_of BaseDecorator
  end
  it 'correct_name method should return a capitalized string' do
    cd = CapitalizeDecorator.new(@nameable_obj)
    expect(cd.correct_name).to eql 'Martin luther'
  end
end
