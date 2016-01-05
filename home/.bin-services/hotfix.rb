require 'active_support/inflector'
require_relative 'story'

class Hotfix < Story
  def save!
    validate_environment_and_arguments!
    validate_git_repository!

    create_hotfix!
  end

  private

  def validate_git_repository!
    GitRepository.new(Dir.pwd).validate_for_hotfix!
  end

  def create_hotfix!
    create_story!("hotfix")
  end
end
