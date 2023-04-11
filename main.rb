require_relative './modules/person'
require_relative './modules/decorators/capitalize_decorator'
require_relative './modules/decorators/trimmer_decorator'

person = Person.new(age: 22, name: 'maximilianus')
p person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
p capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
p capitalized_trimmed_person.correct_name
