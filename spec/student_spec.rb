require_relative '../modules/student'

describe Student do
    before (:each) do
        @classroom = double('Classroom')
        @student =Student.new(id: 100, age: 16, name: "Student name", classroom: @classroom, parent_permission: true )
    end

    it 'is instance of Student' do
        expect(@student).to be_an_instance_of(Student)
    end

    it '#play_hooky' do
        expect(@student.play_hooky).to be_an_instance_of(String)
    end

    it '#to_json' do
        expect(@student.to_json).to be_an_instance_of(String)
    end
end