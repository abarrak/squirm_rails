namespace :db do
  namespace :functions do
    task :load => :environment do
      functions = File.read(Rails.root.join("db", "functions.sql"))
      ActiveRecord::Base.connection.execute functions
    end
  end

  task :migration_hook do
    at_exit { Rake::Task["db:functions:load"].invoke }
  end

  Rake::Task['db:migrate'].enhance(['db:migration_hook'])
  Rake::Task['db:schema:load'].enhance(['db:migration_hook'])
end
