require_relative 'model/file_model'

class App
  def initialize(jobs = [])
    @jobs = jobs
  end

  def run
    puts "Welcome to Job Tracker!"

    loop do
      puts
      puts "Please choose an option by entering a number:"
      puts "1 - Add new company name"
      puts "2 - List all job applications"
      puts "3 - Find job by ID"
      puts "4 - Update status"
      puts "5 - Exit"

      choice = gets.chomp.to_i
      case choice
      when 1
        add_job
      when 2
        list_all_jobs
      when 3
        find_by_id
      when 4
        update_status
      when 5
        puts "Goodbye!"
        break
      else
        puts "Option not yet implemented."
      end
    end
  end

  private

  def add_job
    puts
    print "Add the name of the company where you applied: "
    company_name = gets.chomp
    print "Add the job link where you applied: "
    job_link = gets.chomp
    print "Job Position: "
    job_position = gets.chomp

    job_status = "applied"
    date_applied = Time.now.strftime("%d-%m-%Y")

    puts
    attrs = {
      "company_name" => company_name,
      "job_link" => job_link,
      "job_status" => job_status,
      "job_position" => job_position,
      "date_applied" => date_applied
    }

    job = Model::FileModel.create(attrs)

    if job
      puts "You have just added a new job"
      puts
      puts "Company Name: #{job[:company_name]}"
      puts "Link: #{job[:job_link]}"
      puts "Status: #{job[:job_status]}"
      puts "Position: #{job[:job_position]}"
      puts "Date: #{job[:date_applied]}"
      puts "----------------"
    end
  end

  def list_all_jobs
    puts
    puts "Jobs that you have been applied: "
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
      puts "There is no data available with that id"
    else
      puts
      puts "Company name: #{job[:company_name]}"
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
