statuses = { 0 => "call", 1 => "rejected", 2 => "Interviewed" }

loop do
  puts
  puts "Choose one of the next options:\n "
  puts "1) Add new job\n"
  puts "2) Show all my jobs applications"
  puts "3) Exit"
  option = gets.chomp.to_i

  if option == 1
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
    job_status = statuses[status_answer]

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

  elsif option == 2
    puts
    puts "Feature under construction"
  elsif option == 3
    return
  else
    puts
    puts "-----> Wrong number! <-----"
  end
end