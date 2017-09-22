# PlugHealthCheck

[![Build Status](https://travis-ci.org/andres99x/plug_health_check.svg?branch=master)](https://travis-ci.org/andres99x/plug_health_check)

Health Check endpoint plug.

Responds with status **200 OK** and body `OK` to `GET` requests at an especific path.

## Installation

Add `plug_health_check` to your dependency list in `mix.exs`:

```elixir
def deps do
  [{:plug_health_check, "~> 0.0.1"}]
end
```
## Docs

Docs can be found at [https://hexdocs.pm/plug_health_check](https://hexdocs.pm/plug_health_check).

## Usage

Plug it into your pipeline:

```elixir
defmodule WebApp do
  use Plug.builder
  plug PlugHealthCheck

  # ... rest of the code
end
```

Customize the path with the `:path` option (default: `/health/check`):

```elixir
defmodule WebApp do
  use Plug.builder
  plug PlugHealthCheck, plug: "/health"

  # ... resto of the code
end
```

## Contibuting

Everyone is welcome to contribute and help it improve!

### Development

#### w/Docker

Requirements:
- docker
- docker-compose

Build the container image with:
```
$ docker-compose build web
```

Open a shell to the container to start working with mix:
```
$ docker-compose run --rm web /bin/bash
```

Run test with:
```
$ docker-compose run web
```
