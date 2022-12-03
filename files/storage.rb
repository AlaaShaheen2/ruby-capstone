require 'json'

module Storage
  def fetch_storage(file)
    path = "./DATA/#{file}.json"
    File.new(path, 'w+') unless File.exist?(path)
    File.write(path, '[]') if File.empty?(path)
    file_contents = File.read(path)
    JSON.parse(file_contents)
  end

  def update_storage(file, data)
    storage = fetch_storage(file)
    storage.push(data)
    json_data = JSON.pretty_generate(storage)
    File.write("./DATA/#{file}.json", json_data)
  end

  def load_storage(file)
    path = "./DATA/#{file}.json"
    if File.exist?(path)
      File.write(path, '[]') if File.empty?(path)
      JSON.parse(File.read(path))
    else
      []
    end
  end
end
