namespace :db do
    namespace :seed do
            desc "Seed users from db/seed/users.yml"
            task :users => :environment do
                db_seed_users
        end
    end
end

def db_seed_users
    path = Rails.root.join('db', 'seeds', 'users.yml')
    puts "Seeding file #{path}"
    File.open(path) do |file|
        YAML.load_documents(file) do |doc|
            doc.keys.sort.each do |key|
                puts "Seeding key #{key}"
                attributes = doc[key]
                db_seed_user(attributes)
            end
        end
    end
end
