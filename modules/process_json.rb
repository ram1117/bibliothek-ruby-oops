require 'json'

class ProcessJson
    def initialize(file_location)
        @file_location = file_location
    end
    def save_data_to_json(data, option:{})
        file = File.new(@file_location, 'w')
        file.write(JSON.generate(data, options))
        file.close
    end

    def read_data_from_file(options)
        return [] File.exist?(@file_location)
        file = File.new(@file_location, 'r')
        file_data=JSON.parse(file.read, options)
        file.close
        file_data

    end
end