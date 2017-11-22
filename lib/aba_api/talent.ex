defmodule AbaAPI.Talent do  
  @moduledoc """
  Uses Hero API v#{AbaAPI.api_version} API.
  """

  import AbaAPI.Util

  @doc """
  Returns one talent
  Params:
  * talent: Talent name or id
  """
  def talent(talent) do
    base_url() <> "/talents/#{talent}"
    |> HTTPoison.get!
    |> handle_response
  end
end
  