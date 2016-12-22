require 'thor'
require_relative 'feature'

class FeatureCLI < Thor
  desc "create STORY_NAME [--labels=one two three]", "Create hotfix story and git branch for it"
  long_desc <<-desc
    This script will create a feature pivotal story and start a feature branch for
    you. All you need to do is pass a story name. It will then create the branch
    name using a slugified version of the name you passed it.

    It will detect who you are hitched with and add both as story owners.

    It won't run under the following conditions:
    \x5  * You have added but uncommitted git changes.
    \x5  * If local develop is not up to date with origin.

    If you want to use it, you have to add your Pivotal API Key and Pivotal
    Project ID as environment variables.

    You can find the your token at the bottom of the User Profile page on Pivotal,
    which you can get to by clicking your name in the top right corner.
    \x5  export PIVOTAL_TOKEN="TOKEN HERE"
    \x5  export PIVOTAL_PROJECT_ID="some_number_here"

    This script can also detect if you are "hitched" with someone using the
    hitch gem (it reads ~/.hitchrc), and add who you are hitched with as story
    owners.  If you don't hitch the Pivotal card will be assigned to $USER (note
    your Pivotal user needs to match your unix user in this case)

    > feature create 'Do The Needful'
  desc

  option :labels, type: :array, desc: "The labels you want to apply to your story"

  def create(story_name)
    feature = Feature.new(
      story_name: story_name,
      labels: options[:labels],
      project_id: project_id,
      pivotal_token: pivotal_token
    )
    feature.save!
  end

  private

  def project_id
    ENV['PIVOTAL_PROJECT_ID']
  end

  def pivotal_token
    ENV['PIVOTAL_TOKEN']
  end
end
