require 'active_support/inflector'
require_relative 'story'

class Feature < Story
  def save!
    validate_environment_and_arguments!
    validate_git_repository!

    create_feature!
  end

  private

  def validate_git_repository!
    GitRepository.new(Dir.pwd).validate_for_feature!
  end

  def create_feature!
    create_story!("feature")
  end
end
