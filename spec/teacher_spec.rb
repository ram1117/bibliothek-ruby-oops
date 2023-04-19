require_relative '../modules/teacher'

describe Teacher do
  before(:each) do
    @classroom = double('Classroom')
    @teacher =
      Teacher.new(
        id: 100,
        age: 36,
        name: 'Teacher name',
        specialization: 'Web developer'
      )
  end

  it 'is instance of Student' do
    expect(@teacher).to be_an_instance_of(Teacher)
  end

  it '#to_json' do
    expect(@teacher.to_json).not_to be_nil
  end

  it '#can_use_services' do
    expect(@teacher.can_use_services).to eql true
  end
end
