# History
# history is managed by rvm (~/.rvm/scripts/irbrc.rb)
# IRB.conf[:SAVE_HISTORY] = 1000
#
# loaded by rvm
# require 'rubygems'
# require 'pp'

if defined? Rails && Rails.env
  require 'logger'
  logger = Logger.new(STDOUT)
  ActiveRecord::Base.logger = logger if defined? ActiveRecord
  ActiveResource::Base.logger = logger if defined? ActiveResource
end

if defined? Sidekiq
  def clear_sidekiq
    Sidekiq::RetrySet.new.clear
    Sidekiq::DeadSet.new.clear
    Sidekiq::ScheduledSet.new.clear
    Sidekiq::Queue.all.each {|q| q.clear}
  end
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

# Usage: distributed_to_dos.count_by { |dtd| dtd.assignments.count }.histogram
# ...and it prints:
# 1: (11) *************************************
# 2: ( 9) ******************************
# 3: (21) ************************************************************************
# 4: ( 2) ******
class Hash
  def histogram(opts = {})
    width = opts[:width] || 80
    tickmark = opts[:tickmark] || '*'

    max_key_len = keys.map(&:to_s).map(&:size).max
    max_value = values.max
    max_value_label_len = values.map(&:to_s).map(&:size).max

    max_value_bar_len = width - max_key_len - max_value_label_len - 5   # 5 for ": " and "(n)"

    keys.each do |key|
      value = self[key]

      left = key.to_s.ljust(max_key_len)
      mid = value.to_s.rjust(max_value_label_len)
      right = tickmark * (value.to_f * max_value_bar_len / max_value).ceil
      puts "#{left}: (#{mid}) #{right}"
    end
  end
end

class Hash
  def to_csv_file(filename, opts = {})
    header_for_key = opts[:header_for_key] || 'key'

    require 'csv'

    CSV.open(filename, 'wb') do |csv|
      csv << [header_for_key, 'value']
      self.each do |key, value|
        csv << [key, value]
      end
    end

    "#{self.size} key-value pairs written to #{filename}"
  end
end
