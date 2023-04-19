require_relative '../modules/person.rb'

describe Person do
    before (:each) do
        @person = Person.new(id:102,age:14,name:'Person Name')
    end

    it "Save the correct value" do
        expect(@person.id).to eql 102
        expect(@person.age).to eql 14 
        expect(@person.name).to eql 'Person Name' 
    end

    it "have a valid type" do
        expect(@person.id).to be_an_instance_of(Integer)
        expect(@person.age).to be_an_instance_of(Integer)
        expect(@person.name).to be_an_instance_of(String)
    end

    it 'have a valid type' do
        @rental = double('rental')
        expect(@person.add_rental(@rental)).to be_an_instance_of(Array)
    end

    it "#can_use_services?" do
    expect(@person.can_use_services?).to eql true
    end

    it '#correct_name' do
    expect(@person.correct_name).to eql 'Person Name'
    end
end