class App
  STATUS = { 0 => "call", 1 => "rejected", 2 => "Interviewed" }

  def initialize(jobs = [])
    @jobs = jobs
  end

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
      "Job name": job_name,
      "Job link": job_link,
      "Date applied": date_applied,
      "Job status": job_status
    }

    puts "You have been added:"
    hash.each do |k, v|
      puts "- #{k}: #{v}"
    end
  end

  def list_all_jobs
    puts
    puts "Feature under construction!"
  end

  def update_status
    puts
    puts "Working on it!"
  end

  def exit
    puts 'Thank you for using this app!'
    # ManageFiles.create_files

  end
end
