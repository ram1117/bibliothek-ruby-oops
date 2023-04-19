require_relative '../modules/decorators/base_decorator'

describe BaseDecorator do
  before :each do
    @nameable_obj = double('nameable object')
    allow(@nameable_obj).to receive(:correct_name) { 'name' }
  end

  it 'should create an instance of BaseDecorator' do
    bd = BaseDecorator.new(@nameable_obj)
    expect(bd).to be_instance_of BaseDecorator
  end

  it 'should create an instance of type Nameable' do
    bd = BaseDecorator.new(@nameable_obj)
    expect(bd).to be_kind_of Nameable
  end
end
