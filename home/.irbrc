# History
# history is managed by rvm (~/.rvm/scripts/irbrc.rb)
# IRB.conf[:SAVE_HISTORY] = 1000
#
# loaded by rvm
# require 'rubygems'
# require 'pp'

begin
  require 'wirble'
  Wirble.colorize
rescue LoadError => err
  warn "Couldn't load Wirble: #{err}"
end

if defined? Rails && Rails.env
  require 'logger'
  logger = Logger.new(STDOUT)
  ActiveRecord::Base.logger = logger if defined? ActiveRecord
  ActiveResource::Base.logger = logger if defined? ActiveResource
end

# lulz

class Object
  def fist
    puts <<-EOF

DID YOU MEAN FIRST?

       ,--.--._
------" _, \___)
        / _/____)
        \//(____)
------\     (__)
       `-----"

EOF

    first
  end
end

class FlagrantSystemError < StandardError
  def initialize(message = 'The system is down.  I dunno what you did, moron, but you sure screwed everything up.')
    super
  end
end

# See http://www.benjaminoakes.com/2014/01/24/count_by-in-ruby/
module Enumerable
  def count_by(&block)
    group_by(&block).map { |criteria, group| [criteria, group.count] }.sort_by(&:last).to_h
  end
end
