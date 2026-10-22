class Mapbox < Formula
  desc "Command-line interface for Mapbox APIs"
  homepage "https://github.com/mapbox/mapbox-cli"
  version "1.1.0"

  MAPBOX_CLI_USER_AGENT = "mapbox-cli-tap-install/1".freeze

  on_macos do
    if Hardware::CPU.arm?
      url "https://cli.mapbox.com/v#{version}/mapbox-v#{version}-aarch64-apple-darwin.tar.gz",
          user_agent: MAPBOX_CLI_USER_AGENT
      sha256 "2d1b573d175f98dcf4013a2e11ba813f010cf2d3f2562f2dc8e3f9a61904c5a0"
    else
      url "https://cli.mapbox.com/v#{version}/mapbox-v#{version}-x86_64-apple-darwin.tar.gz",
          user_agent: MAPBOX_CLI_USER_AGENT
      sha256 "b64a7e89457383ad3d86807ebadfcad792ac75ca43e11344ef116ccc7029df41"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://cli.mapbox.com/v#{version}/mapbox-v#{version}-aarch64-unknown-linux-musl.tar.gz",
          user_agent: MAPBOX_CLI_USER_AGENT
      sha256 "8b4ddc409600311468fc7e4899680ae74a8466f1dcc48084d140cc3afa2111da"
    else
      url "https://cli.mapbox.com/v#{version}/mapbox-v#{version}-x86_64-unknown-linux-musl.tar.gz",
          user_agent: MAPBOX_CLI_USER_AGENT
      sha256 "929d5d28caf81d84635646f42ba149b3699a09e4c07acb64560d3f731748e3b9"
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
