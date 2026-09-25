class Mapbox < Formula
  desc "Command-line interface for Mapbox APIs"
  homepage "https://github.com/mapbox/mapbox-cli"
  version "0.2.1"

  MAPBOX_CLI_USER_AGENT = "mapbox-cli-tap-install/1".freeze

  on_macos do
    if Hardware::CPU.arm?
      url "https://cli.mapbox.com/v#{version}/mapbox-v#{version}-aarch64-apple-darwin.tar.gz",
          user_agent: MAPBOX_CLI_USER_AGENT
      sha256 "91fd63c9eb6b9825a71898259377662324885f0dee81d59a7ea24350c133bd80"
    else
      url "https://cli.mapbox.com/v#{version}/mapbox-v#{version}-x86_64-apple-darwin.tar.gz",
          user_agent: MAPBOX_CLI_USER_AGENT
      sha256 "f6d6eabbeb10188b138917dccff04b685a868713afb4fe09f94e664aaf4214b0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://cli.mapbox.com/v#{version}/mapbox-v#{version}-aarch64-unknown-linux-musl.tar.gz",
          user_agent: MAPBOX_CLI_USER_AGENT
      sha256 "b57782403cbbdbe8ce0289a737d006473d332822323c67ce2c852ba153c71cb3"
    else
      url "https://cli.mapbox.com/v#{version}/mapbox-v#{version}-x86_64-unknown-linux-musl.tar.gz",
          user_agent: MAPBOX_CLI_USER_AGENT
      sha256 "29ef1a2c2d3cba6f498373a080b86f5f82e290988a851d527749425e697f2103"
    end
  end

  def install
    bin.install "mapbox"

    generate_completions_from_executable(bin/"mapbox", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mapbox --version")
  end
end
