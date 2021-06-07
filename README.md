# MarsRovers
[![ci](https://github.com/cgerling/mars-rovers/actions/workflows/ci.yml/badge.svg)](https://github.com/cgerling/mars-rovers/actions/workflows/ci.yml)

This reposityory contains a custom solution of the [Mars Rovers Technical Challenge](https://code.google.com/archive/p/marsrovertechchallenge/).
This solutions differs a little from what the challenge asks, mostly in the output format, the final position of the rover is only it's coordinates when the rover didn't crashed or moved out of the plateau, in such cases a message is showed instead.

## Usage

Since this project cannot run in a standalone mode, the easiest way to use it is through `iex` (by executting `iex -S mix`).
You can pass your input `MarsRover.deploy/1` as a multiline string to deploy your own squad.

### Dependencies
- Elixir 1.12
- Erlang/OTP 24

