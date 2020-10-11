class GitRedate < Formula
  desc "Change dates of git commits"
  homepage "https://github.com/dfang/git-redate"
  url "https://github.com/dfang/git-redate/archive/0.1.tar.gz"
  version "0.1"
  sha256 "637fb8a9daaaee093533f45576574ed2294f4cc6dc1869d1daf8a76dea0519f9"

  def install
    bin.install "git-redate"
  end
end
