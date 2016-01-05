require 'thor'
require_relative 'hotfix'

class HotfixCLI < Thor
  desc "create STORY_NAME [labels]", "Create hotfix story and git branch for it"
  long_desc <<-eoht
    This script will create a bug pivotal story and start a hotfix branch for
    you. All you need to do is pass a story name. It will then create the branch
    name using a slugified version of the name you passed it.

    It won't run under the following conditions:
    \x5  * You have added but uncommitted git changes.
    \x5  * If local master and develop are not up to date with origin.
    \x5  * If you already have a local hotfix branch (because git-flow won't run)

    If you want to use it, you have to add your Pivotal API Key and Pivotal
    Project ID as environment variables.

    You can find the your token at the bottom of the User Profile page on Pivotal,
    which you can get to by clicking your name in the top right corner.
    \x5  export PIVOTAL_TOKEN="TOKEN HERE"
    \x5  export PIVOTAL_PROJECT_ID="some_number_here"

    This script can also detect if you are "hitched" with someone using the
    hitch gem (it reads ~/.hitchrc), and add who you are hitched with as story owners.
    If you don't hitch the Pivotal card will
    be assigned to $USER (note your Pivotal user needs to match your unix user
    in this case)

        create-hotfix create 'Do The Needful'
  eoht

  option :labels, type: :array, desc: "The labels you want to apply to your story"

  def create(story_name)
    hotfix = Hotfix.new(
      story_name: story_name,
      labels: options[:labels],
      project_id: project_id,
      pivotal_token: pivotal_token
    )
    hotfix.save!
  end

  private

  def project_id
    ENV['PIVOTAL_PROJECT_ID']
  end

  def pivotal_token
    ENV['PIVOTAL_TOKEN']
  end
end
