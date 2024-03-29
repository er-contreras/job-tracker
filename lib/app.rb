class App
  STATUS = { 0 => "Applied", 1 => "Unknown" }

  def initialize(jobs = [])
    @jobs = jobs
  end

  private

  def add_job
    puts
    puts "Add the name of the job that you applied: "
    job_name = gets.chomp
    puts "Add the job link where you applied"
    job_link = gets.chomp

    date_applied = Time.now.strftime("%d-%m-%Y")

    puts "Choose between these status 0) Applied, 1) Unknown"
    status_answer = gets.chomp.to_i
    job_status = STATUS[status_answer]

    puts
    hash = {
      "job_name": job_name,
      "job_link": job_link,
      "job_status": job_status,
      "date_applied": date_applied
    }

    @jobs.push(hash)

    puts "You have been added:"
    hash.each do |k, v|
      puts "- #{k}: #{v}"
    end
  end

  def list_all_jobs
    puts
    puts "Jobs that you have been applied:"
    puts
    @jobs.each do |job|
      puts "Name: #{job[:job_name]}"
      puts "Link: #{job[:job_link]}"
      puts "Status: #{job[:job_status]}"
      puts "Date: #{job[:date_applied]}"
      puts "----------------"
    end
  end

  def update_status
    puts
    puts "Working on it!"
  end

  def exit
    puts 'Thank you for using this app!'
  end
end
