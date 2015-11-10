require_relative 'story'

class Hotfix < Story
  def save!
    validate_environment_and_arguments
    validate_git_repository

    create_hotfix!
  end

  private

  def validate_git_repository
    GitRepository.new(Dir.pwd).validate_for_hotfix
  end

  def create_hotfix!
    story = pivotal_project.create_hotfix(name: story_name.titleize,
                                          owner_usernames: derive_story_owners)

    puts "Your pivotal story is https://www.pivotaltracker.com/story/show/#{story.id}"
    puts "Creating hotfix branch for #{story_name}"

    `git flow hotfix start #{create_hotfix_name(story.id)}`
  end

  def create_hotfix_name(story_id)
    Shellwords.shellescape("#{story_id}-#{story_name.parameterize}")
  end
end
