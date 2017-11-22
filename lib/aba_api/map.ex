defmodule AbaAPI.Map do  
  @moduledoc """
  Uses Hero API v#{AbaAPI.api_version} API.
  """

  import AbaAPI.Util

  @doc """
  Returns one map
  Params:
  * map: Map name or id
  """
  def map(map) do
    base_url() <> "/maps/#{replace_spaces(map)}"
    |> HTTPoison.get!
    |> handle_response
  end

  @doc """
  Returns all maps
  """
  def maps() do
    base_url() <> "/maps"
    |> HTTPoison.get!
    |> handle_response
  end
end
  