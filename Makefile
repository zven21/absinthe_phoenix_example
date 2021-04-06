.PHONY: help


# app
iex:
	iex --erl "-kernel shell_history enabled" -S mix

format:
	mix format

server:
	iex --erl "-kernel shell_history enabled" -S mix phx.server