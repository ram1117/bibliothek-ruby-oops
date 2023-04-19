require_relative '../modules/book.rb'

describe Book do
    before (:each) do
        @book = Book.new('Book Title', 'Book Author')
        @rentals = double('Rental')
    end

    it 'should be a valid type' do
        expect(@book.title).to be_instance_of(String)
        expect(@book.author).to be_instance_of(String)
    end

    it 'Book class should save correct value ' do
        expect(@book.title).to eql 'Book Title'
        expect(@book.author).to eql 'Book Author'
    end
    it 'should add rental' do
        @book.add_rental(@rentals)
        expect(@book.rentals.length).to eql 1
    end

    it 'should add rental' do
        @book.to_json()
        expect(@book.to_json).to be_instance_of(String)
    end
end