require_relative 'model/file_model'

class App
  STATUS = { 0 => "Applied", 1 => "Unknown" }

  def initialize(jobs = [])
    @jobs = jobs
  end

  private

  def add_job
    puts
    print "Add the name of the job that you applied: "
    job_name = gets.chomp
    print "Add the job link where you applied: "
    job_link = gets.chomp
    print "Choose between these status 0) Applied, 1) Unknown: "
    status_answer = gets.chomp.to_i
    print "Job Position: "
    job_position = gets.chomp

    date_applied = Time.now.strftime("%d-%m-%Y")
    job_status = STATUS[status_answer]

    puts
    hash = {
      "job_name": job_name,
      "job_link": job_link,
      "job_status": job_status,
      "job_position": job_position,
      "date_applied": date_applied
    }

    @jobs.push(hash)

    puts "You have been added: "
    hash.each do |k, v|
      puts "- #{k}: #{v}"
    end
  end

  def list_all_jobs
    puts
    print "Jobs that you have been applied: "
    puts

    jobs = Model::FileModel.all

    jobs.each do |job|
      puts "Name: #{job[:job_name]}"
      puts "Link: #{job[:job_link]}"
      puts "Status: #{job[:job_status]}"
      puts "Position: #{job[:job_position]}"
      puts "Date: #{job[:date_applied]}"
      puts "----------------"
    end
  end

  def find_by_id
    puts
    print "Enter the job id: "

    job_id = gets.chomp.to_i
    job = Model::FileModel.find(job_id)

    if job.nil?
      puts
      puts "There is no data with that id"
    else
      puts
      puts "Name: #{job[:job_name]}"
      puts "Link: #{job[:job_link]}"
      puts "Status: #{job[:job_status]}"
      puts "Position: #{job[:job_position]}"
      puts "Date: #{job[:date_applied]}"
      puts "----------------"
    end
  end

  def update_status
    puts
    puts "Working on it!"
  end

  def exit
    puts
    puts 'Thank you for using this app!'
  end
end
