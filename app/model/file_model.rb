require 'json'

module Model
  class FileModel
    def initialize(filename)
      @filename = filename

      basename = File.split(filename)[-1]
      @id = File.basename(basename, ".json").to_i

      obj = File.read(filename)
      @hash = JSON.load(obj)
    end

    def [](name)
      @hash[name.to_s]
    end

    def []=(name, value)
      @hash[name.to_s] = value
    end

    def self.find(id)
      begin
        FileModel.new("db/jobs/#{id}.json")
      rescue
        return nil
      end
    end

    def self.all
      json_files_path = File.expand_path('../../db/jobs/*.json', __dir__)
      files = Dir.glob(json_files_path)

      files.map { |f| FileModel.new f }
    end
  end
end