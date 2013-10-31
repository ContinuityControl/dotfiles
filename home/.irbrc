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
