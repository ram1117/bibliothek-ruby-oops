require 'json'

class ProcessJson
  def initialize(file_location)
    @file_location = file_location
  end
  def save_data_to_json(data)
    unless data.empty?
      file = File.new(@file_location, 'w')
      data.each do |obj|
        file.write(obj.to_json)
        file.write("\n")
      end
      file.close
    end
  end

  def read_data_from_file
    return [] unless File.exist?(@file_location)
    data = []
    file = File.new(@file_location, 'r')
    file.each { |obj| data << JSON.parse(obj) }
    file.close
    data
  end
end
