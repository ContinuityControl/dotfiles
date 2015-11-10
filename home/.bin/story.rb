require 'shellwords'
require 'yaml'
require 'active_support'
require_relative 'git_repository'
require_relative 'pivotal_project'

class Story
  def initialize(story_name:, project_id:, pivotal_token:)
    @story_name = story_name
    @project_id = project_id
    @pivotal_token = pivotal_token
  end

  private

  attr_reader :story_name, :project_id, :pivotal_token

  def validate_environment_and_arguments!
    if env_variable_undefined?(story_name)
      raise ArgumentError, "please pass a pivotal story name"
    end

    if env_variable_undefined?(project_id)
      raise ArgumentError, "You need to populate the PIVOTAL_PROJECT_ID environment variable"
    end

    if env_variable_undefined?(pivotal_token)
      raise ArgumentError, "You need to populate the PIVOTAL_TOKEN environment variable"
    end
  end

  def env_variable_undefined?(variable)
    variable.nil? || variable.empty?
  end

  def pivotal_project
    PivotalProject.new(pivotal_token, project_id)
  end

  def derive_story_owners
    hitch_config = YAML.load_file("#{ENV['HOME']}/.hitchrc")
    if hitch_config[:current_pair].empty?
      Array(ENV['USER'])
    else
      hitch_config[:current_pair]
    end
  end

  def branch_name(story_id)
    Shellwords.shellescape("#{story_id}-#{story_name.parameterize}")
  end
end
