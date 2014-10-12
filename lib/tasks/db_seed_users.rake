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
                create_a_seed_user(attributes)
            end
        end
    end
end

def create_a_seed_user(attributes)
  User.create(attributes)
end

# def db_seed_user(attributes)
#   mail = attributes['mail']
#   user = User.where(mail: mail).first_or_create
#   if user
#       puts "This email address exists: #{mail}"

#       # update the user with user.update(name: attributes['name'])
#   else
#       puts "This email address is new: #{mail}"
#       User.create(attributes)
#   end
# end