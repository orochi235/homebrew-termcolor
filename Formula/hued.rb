class Hued < Formula
  desc "Set terminal background color per directory, like .editorconfig for your terminal"
  homepage "https://github.com/orochi235/hued"
  url "https://github.com/orochi235/hued/archive/refs/tags/v2.2.0.tar.gz"
  sha256 "db6027e37433399d4ef61f275d08955ff8b134d35c22d9b0858f09a257daa5c2"
  license "MIT"

  def install
    bin.install "bin/hued"
    share.install "hued.sh"
    share.install "hued-names.sh"
    share.install "hued.fish"
    bash_completion.install "completions/hued.bash"
    zsh_completion.install "completions/_hued"
    fish_completion.install "completions/hued.fish"
  end

  def caveats
    <<~EOS
      Add to your shell config:

      Zsh (~/.zshrc):
        source #{share}/hued.sh
        precmd_functions+=(_hued_apply)

      Bash (~/.bashrc):
        source #{share}/hued.sh
        PROMPT_COMMAND="_hued_apply${PROMPT_COMMAND:+; $PROMPT_COMMAND}"

      Fish:
        cp #{share}/hued.fish ~/.config/fish/conf.d/hued.fish
    EOS
  end
end
