require 'json'

module FileManager

  def self.save_list(fileName, array)
    jsonArray = array.map { |task|
      {
        "name" => task.name,
        "complete" => task.getComplete()
      }
    }

    jsonArray.to_json

    File.write('./lists/' + fileName + ".json", JSON.dump(jsonArray))

  end

  def self.load_list(fileName)
    file = File.read('./lists/' + fileName + '.json')
    return file
  end

end