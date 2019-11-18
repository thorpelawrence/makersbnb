# frozen_string_literal: true

require 'pg'
require 'dotenv/load'

class Database
  def self.connect
    if ENV['RACK_ENV'] == 'test'
      PG.connect(ENV['DB_URL'])
    else
      PG.connect(dbname: 'makersbnb_test')
    end
  end
end
