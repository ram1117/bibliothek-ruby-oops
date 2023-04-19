require_relative '../modules/classroom'

describe Classroom do
  before(:each) do
    @classroom = Classroom.new('Ruby class')
    @student = double('student')
    allow(@student).to receive(:classroom=) { nil }
  end

  it 'instance of Classroom' do
    expect(@classroom).to be_instance_of(Classroom)
  end

  it '#add_students' do
    @classroom.add_students(@student)
    expect(@classroom.students.length).to be 1
  end
end
