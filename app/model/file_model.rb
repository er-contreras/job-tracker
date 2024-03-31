require 'json'

module Model
  class FileModel
    FILES_PATH = File.expand_path('../../db/jobs/*.json', __dir__)

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

    def self.all
      files = Dir.glob(FILES_PATH)

      files.map { |f| FileModel.new f }
    end

    def self.find(id)
      begin
        FileModel.new(file_path_for_id(id))
      rescue
        return nil
      end
    end

    def self.create(attrs)
      hash = {}
      hash["job_name"] = attrs["job_name"] || ""
      hash["job_link"] = attrs["job_link"] || ""
      hash["job_status"] = attrs["job_status"] || ""
      hash["job_position"] = attrs["job_position"] || ""
      hash["date_applied"] = attrs["date_applied"] || ""

      files = Dir.glob(FILES_PATH)
      names = files.map { |f| File.split(f)[-1] }
      highest = names.map { |b| b.to_i }.max
      id = !highest.nil? ? highest + 1 : 1

      File.open(file_path_for_id(id), "w") do |f|
        f.write <<~TEMPLATE
          {
            "job_name": "#{hash["job_name"]}",
            "job_link": "#{hash["job_link"]}",
            "job_status": "#{hash["job_status"]}",
            "job_position": "#{hash["job_position"]}",
            "date_applied": "#{hash["date_applied"]}"
          }
        TEMPLATE
      end

      FileModel.new file_path_for_id(id)
    end

    private

    def self.file_path_for_id(id)
      File.expand_path("../../db/jobs/#{id}.json", __dir__)
    end
  end
end