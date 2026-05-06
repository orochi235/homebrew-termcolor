class Hued < Formula
  desc "Set terminal background color per directory, like .editorconfig for your terminal"
  homepage "https://github.com/orochi235/hued"
  url "https://github.com/orochi235/hued/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "5078c5249ee2229a0b4edb419eae67cc800df80bdc280172134fe7a3a6460902"
  license "MIT"

  def install
    bin.install "bin/hued"
    share.install "hued.sh"
    share.install "hued-names.sh"
    share.install "hued.fish"
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
