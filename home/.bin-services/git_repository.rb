require 'git'

class GitError < StandardError; end
class GitFlowError < StandardError; end

class GitRepository
  def initialize(path_to_repo)
    @repo = find_git_repo(path_to_repo)
  end

  def validate_for_hotfix!
    puts "Checking for commited files"
    if has_added_files?
      raise GitError, "Please commit or stash all added files."
    end

    puts "Checking if master and develop are up to date"
    if !master_up_to_date? || !develop_up_to_date?
      raise GitError, "Please pull --rebase master and develop"
    end
  end

  def validate_for_feature!
    puts "Checking for commited files"
    if has_added_files?
      raise GitError, "Please commit or stash all added files."
    end

    puts "Checking if develop is up to date"
    if !develop_up_to_date?
      raise GitError, "Please pull --rebase develop"
    end
  end

  private

  def has_added_files?
    !@repo.status.added.empty?
  end

  def master_up_to_date?
    branch_up_to_date?('master')
  end

  def develop_up_to_date?
    branch_up_to_date?('develop')
  end

  def has_existing_branch_name?(branch_name)
    !@repo.branches.local.map(&:name).select { |name| name =~ /^#{branch_name}.*/ }.empty?
  end

  def branch_up_to_date?(branch_name)
    @repo.revparse(branch_name) == @repo.revparse("origin/#{branch_name}")
  end

  def no_git_repo_can_be_found
    !system 'git status'
  end

  def find_git_repo(initial_dir)
    if no_git_repo_can_be_found
      raise GitError
    end

    if Dir.exist?('.git')
      Git.open(initial_dir)
    else
      Dir.chdir('..')
      find_git_repo(Dir.pwd)
    end
  end
end
