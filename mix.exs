defmodule AbaAPI.Mixfile do
  use Mix.Project

  def project do
    [
      app: :aba_api,
      name: "AbaAPI",
      description: "AbaAPI is an Elixir wrapper for the HOTS API (https://hotsapi.net/).",
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps(),
      docs: docs()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      { :ex_doc,      "~> 0.18.1", only: :dev },
      { :httpoison,   "~> 0.13"               },
      { :poison,      "~> 3.1"                }
    ]
  end

  defp docs do
    [
      main: "AbaAPI",
      extras: ["README.md"],
      output: ["docs"]
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      maintainers: ["Joshua Scheel"],
      links: %{"Github": "https://github.com/jscheel42/aba_api",
               "TravisCI": "https://travis-ci.org/jscheel42/aba_api"}
    ]
  end
end
