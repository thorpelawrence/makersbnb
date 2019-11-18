# frozen_string_literal: true

require 'pg'
require 'dotenv/load'

class Database
  def self.connect
    if ENV['RACK_ENV'] == 'test'
      PG.connect(dbname: 'makersbnb_test')
    else
      PG.connect(ENV['DB_URL'])
    end
  end
end
