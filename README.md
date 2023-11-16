# To create a project

rails new rspec_app --skip-test

# change into it

cd rspec_app/

# open project in VS Code

code .

# Add a gem in Gemfile

gem "rspec"

gem "rspec-rails"

# Setup the rspec in our project

rails g rspec:install

OR

rspec --init

# To run the RSpec

bundle install exec rspec

# Sample test

#spec/sample_spec.rb
require 'rails_helper'

class NumberCalculator

    def demo
        "Demo"
    end

end

RSpec.describe "Number Calculator", type: :view do

    it "Testing String" do
        expect(1).to eq(1)
    end

    it "Testing the Demo string" do
        number=NumberCalculator.new
        expect(number.demo).to eq("Demo")
    end

end

# setup :rspec test_framework in config/application.rb

# Don't generate system test files.

    config.generators.system_tests = nil
    config.generators do |g|
      # g.test_framework = :rspec
      g.test_framework(
        :rspec,
        # fixtures: false,
        # model_specs: false,
        # request_specs: false,
        # view_specs: false,
        # helper_specs: false,
        # routing_specs: false
      )
    end

=> The scaffold makes automatically generating the fixtures,models,requests,views.helpers,routings files automatically.

# To create a User Spec model file

rails g rspec:model User

    Note: Before execute spec/model/user_spec.rb file
            => Need to create User Model
            => Need to run Migrations

user_spec.rb:-

# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do

    describe "Calculations" do
        it "expect 1+2+3 to eq 6" do
            expect(1+2+3).to eql(6)
        end

        it "expect 1+2+3 to not eq 10" do
            expect(1+2+3).to_not eq
            (10)
            expect(1+2+3).not_to eq(10)

        end

        it "expect true to be true" do
            expect(true).to be(true)
        end
    end

end

# To run all spec files in spec

rspec spec

# To run single files

rspec spec/models/user_spec.rb

# To run all models

rspec spec/models

# To run all views

rspec spec/views

# To run all routes

rspec spec/routes

# To run all requests

rspec spec/routes

# To run single files with line number

rspec spec/models/user_spec.rb:5 ( To run the 5th line to end )
rspec spec/models/user_spec.rb:5:11 ( To run the 5th line to 11th line )

# Use Scaffold

rails g scaffold Admin firstname:string lastname:string

=====

# Adding the factory_bot_rails in Gemfile

gem "factory_bot_rails"

# run bundle

bundle install

# To Create model Dummy

rails g model Dummy name age:integer born_at:datetime

    => create spec/factories/dummies.rb

FactoryBot.define do

    factory :dummy do

        name { "Anil" }

        age { 36 }

        born_at { "2023-10-27 09:18:25" }

    end

end

# To run the migrations

rails db:migrate

# To Open the dummy_spec.rb

# To create the migration

rails g migration add_email_to_dummy email:string

# To run the migration

rails db:migrate

# update unique: true and null: fale in migration file

class AddEmailToDummy < ActiveRecord::Migration[7.1]

    def change
        add_column :dummies, :email, :string, null: false
        add_index :dummies, :email, unique: true
    end

end

# To run the migration

rails db:migrate

# add the email in factories/dummies.rb

email { "anil@gmail.com" }

# To run the

rspec spec/models/dummies.rb

Note:

    SQLite3::ConstraintException: UNIQUE constraint failed: dummies.email

    it "must have an age greater than 21" do
        dummy = FactoryBot.create(:dummy)
        dummy1 = FactoryBot.create(:dummy) # dummy = FactoryBot.create(:dummy, age: 11)
        expect(dummy.age).to be >= 21
        expect(dummy1.email).to eq("anil@gmail.com")
    end

# Update spec/factories/dummies.rb

sequence(:email) { |n| "anil+#{n}@gmail.com" }

# Update spec/models/dummy_spec.rb

expect(dummy.email).to eq("anil+1@gmail.com")
expect(dummy1.email).to eq("anil+2@gmail.com")

# To run the spec

spec spec/models/dummy_spec.rb

1 example, 0 failures

## To change the setup like create(:dummy) in spec/factories/dummies.rb file

#SETUP spec/rails_helper.rb
config.include FactoryBot::Syntax::Methods

# Update spec/models/dummy_spec.rb

Old : dummy = FactoryBot.create(:dummy)
change : dummy = create(:dummy)

# To run the spec file

rspec spec/models/dummy_spec.rb
1 example, 0 failures

# Add a gem file in Gemfile

# Pry is a runtime developer console and IRB alternative with powerful introspection capabilities.

# Pry aims to be more than an IRB replacement

gem "pry-rails"

# bundle execute

bundle install

# Degugging purpose

rails c

dummy = FactoryBot.crete(:dummy)

or

FactoryBot.create(:dummy)

Dummy.count

dummy3 = FactoryBot.build(:dummy)
or
FactoryBot.build(:dummy)

Dummy.count

# disable the factory_bot via configuration

g.factory_bot false

Note: Models Constant values and Methods access in RSpec testing

Model:

    MAX=10 in Model.
    def modleMethod?
    end

Testing:

    it "it is #{MAX}" do
        expec(1).to be_modelMethod
    end

# Add Documentation in .rspec file

--require spec_helper --format documentation

######################################
Job specs for rspec with Ruby on Rails
###################################

### Adding SETUP in config/environment/test.rb

config.active_job.queue_adapter = :test

Note:
rspec --format documentation spec/models/user_spec.rb

################
Automated Testing wiht RSpec
################

# Add a gem webmock

gem "webmock"

bundle install

# Add the spec/spec_helper.rb

require 'webmock/rspec'

# run bundle

bundle install

Note:
byebug and mapping for debuging

###############################
Rspec request specs for an API Controller with Rails
###############################

# Create RSpec request for

rails g rspec:request api/prices

OR

rails g rspec:controller api/prices

    create spec/requests/demo_spec.rb

# Scaffold for comment

#### ALL requests,views,routing

rails g rspec:scaffold comment

    create spec/requests/comments_spec.rb

    create  spec/views/comments/edit.html.erb_spec.rb

    create  spec/views/comments/index.html.erb_spec.rb

    create  spec/views/comments/new.html.erb_spec.rb

    create  spec/views/comments/show.html.erb_spec.rb

    create  spec/routing/comments_routing_spec.rb

# To create rspec request only

rails d rspec:request scaffold comment

# To create a User Spec model file

rails g rspec:model Demo

      create  spec/models/demo_spec.rb

      invoke  factory_bot

      create    spec/factories/demos.rb

# To Create a Rspec View User folder

rails g rspec:view user

    create spec/views/user

# To Create a RSpec view pages

rails g rspec:view user index show

      create  spec/views/user
      create  spec/views/user/index.html.erb_spec.rb
      create  spec/views/user/show.html.erb_spec.rb

# Named routes should work if you put the following in rspec_helper.rb

RSpec.configure do |config|

    config.include Rails.application.routes.url_helpers

end
