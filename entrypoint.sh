#!/bin/bash

mix local.hex --force
mix deps.get

exec "$@"
