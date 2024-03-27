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
    puts "Add a descriptive word of job"
    job_description = gets.chomp
    date_applied = Time.now.strftime("%d-%m-%Y")

    puts "Choose between these status 0) call, 1) rejected, 2) Interviewed"
    status_answer = gets.chomp.to_i
    job_status = STATUS[status_answer]

    puts
    hash = {
      "Job name": job_name,
      "Job link": job_link,
      "Job description": job_description,
      "Date appied": date_applied,
      "Job status": job_status
    }

    hash.each do |k, v|
      puts "#{k}: #{v}"
    end
  end

  def list_all_jobs
    puts
    puts "Feature under construction"
  end
end
