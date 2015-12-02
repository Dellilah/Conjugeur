namespace :dev do
  desc "move data in jsons files to YML"
  task migrate_bescherelle_from_json: :environment do
    puts 'Invoking verbs creation...'
    Rake::Task["dev:create_verbs_bescherelle"].invoke
  end
end
