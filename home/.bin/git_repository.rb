require 'git'

class GitRepository
  def initialize(path_to_repo)
    @repo = find_git_repo(path_to_repo)
  end

  def has_added_files?
    !@repo.status.added.empty?
  end

  def branch_up_to_date?(branch_name)
    @repo.revparse(branch_name) == @repo.revparse("origin/#{branch_name}")
  end

  def has_existing_branch_name?(branch_name)
    !@repo.branches.local.map(&:name).select { |name| name =~ /^#{branch_name}.*/ }.empty?
  end

  private

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
