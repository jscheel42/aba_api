defmodule UtilTest do
  use ExUnit.Case
  doctest AbaAPI.Util

  test "returns base_url" do
    assert AbaAPI.Util.base_url() == "http://hotsapi.net/api/v#{AbaAPI.api_version}"
  end
end
