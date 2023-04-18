require 'json'

class ProccessJsonFile
  def initialize(file_location)
    @file_location = file_location
  end

  def save_to_json(data, options: {})
    file = File.new(@file_location, 'w')
    file.write(JSON.generate(data, options))
    file.close
  end

  def read_json(options: {})
    return [] unless File.exist?(@file_location)

    file = File.new(@file_location, 'r')
    file_data = JSON.parse(file.read, options)
    file.close
    file_data
  rescue StandardError
    puts "no file found to read on #{@file_location}"
    nil
  end
end