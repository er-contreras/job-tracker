#! /usr/bin/env ruby

require_relative '../lib/app'
# require_relative 'manage_files'

class Main
  # include ManageFiles

  @actions = {
    '1' => :add_job,
    '2' => :list_all_jobs,
    '3' => :exit
  }

  def self.main
    app = App.new
    status = true

    puts
    puts 'Welcome to job tracker app!'
    while status
      puts
      puts 'Please choose an option by enterin a number:'
      puts '1 - Add new job'
      puts '2 - List all jobs application'
      puts '3 - Exit'

      option = gets.chomp
      action = @actions[option]

      call_case(app, action) do
        status = false
      end
    end
  end

  def self.call_case(app, action)
    if action
      case action
      when :exit
        puts 'Thank you for using this app!'
        # ManageFiles.create_files
        yield
      else
        app.send(action)
      end
    else
      puts 'Sorry, you choose a wrong option'
    end
  end
end

Main.main # Call main method to run the program.
