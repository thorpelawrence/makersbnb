# frozen_string_literal: true

require 'pg'
require 'dotenv/load'

class Database
  def self.connect
    PG.connect(ENV['DB_URL'])
  end
end
