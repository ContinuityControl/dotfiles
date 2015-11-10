require_relative 'story'

class Feature < Story
  def save!
    validate_environment_and_arguments!
    validate_git_repository

    create_feature!
  end

  private

  def validate_git_repository
    GitRepository.new(Dir.pwd).validate_for_feature
  end

  def create_feature!
    story = pivotal_project.create_feature(name: story_name.titleize,
                                           owner_usernames: derive_story_owners)

    puts "Your pivotal story is https://www.pivotaltracker.com/story/show/#{story.id}"
    puts "Creating feature branch for #{story_name}"

    `git flow feature start #{branch_name(story.id)}`
  end
end
