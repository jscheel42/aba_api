defmodule AbaAPITest do
  use ExUnit.Case
  doctest AbaAPI

  test "greets the world" do
    assert AbaAPI.hello() == :world
  end
end
