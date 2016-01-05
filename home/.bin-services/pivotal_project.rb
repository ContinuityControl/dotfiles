require 'tracker_api'

class PivotalProject
  def initialize(pivotal_token, project_id)
    client = TrackerApi::Client.new(token: pivotal_token)
    # we only have one project so this works well
    @project = client.project(project_id)
  end

  def create_story(type, options)
    if type == "feature"
      create_feature(options)
    elsif type == "hotfix"
      create_hotfix(options)
    end
  end

  def create_hotfix(options)
    story_owner_ids = find_users(options[:owner_usernames]).map(&:id)
    project.create_story(name: options[:name],
                         labels: options[:labels],
                         story_type: 'bug',
                         current_state: 'started',
                         owner_ids: story_owner_ids)
  end

  def create_feature(options)
    story_owner_ids = find_users(options[:owner_usernames]).map(&:id)
    project.create_story(name: options[:name],
                         labels: options[:labels],
                         story_type: 'feature',
                         current_state: 'started',
                         estimate: 0,
                         owner_ids: story_owner_ids)
  end

  private

  attr_reader :project

  def find_users(owner_usernames)
    project.memberships.map(&:person).select do |person|
      owner_usernames.include? person.email.split("@").first
    end
  end
end
