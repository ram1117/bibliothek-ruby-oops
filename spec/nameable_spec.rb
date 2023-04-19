require_relative '../modules/nameable'

describe Nameable do
  it 'should raise a NotImplementedError' do
    nameobj = Nameable.new
    expect { nameobj.correct_name }.to raise_error(
      NotImplementedError,
      'method not defined',
    )
  end
end
