defmodule PlugHealthCheck.Mixfile do
  use Mix.Project

  @version "0.0.1"
  @name "PlugHealthCheck"
  @github_url "https://github.com/andres99x/plug_health_check"
  @description """
  Plug HealthCheck endpoint that returns the health of the service
  """

  def project do
    [
      app: :plug_health_check,
      version: @version,
      name: @name,
      description: @description,
      source_url: @github_url,
      elixir: "~> 1.5",
      deps: deps(),
      package: package()
     ]
  end

  def application do
    []
  end

  defp deps do
    [
      {:plug, "~> 1.0"}
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      maintainers: ["Andres Pache"],
      links: %{"GitHub" => @github_url}
    ]
  end
end
