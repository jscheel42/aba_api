defmodule AbaAPI.Replay do  
  @moduledoc """
  Uses Hero API v#{AbaAPI.api_version} API.
  """

  import AbaAPI.Util

  @doc """
  Returns one replay
  """
  def replay(replay_id) do
    base_url() <> "/replays/#{replay_id}"
    |> HTTPoison.get!
    |> handle_response
  end

  @doc """
  Returns replays
  Params:
  * opt: Map with the following keys:
    * min_id: Minimum replay id in database. Useful for paging and pulling incremental data.
    * start_date: Minimum replay date
    * end_date: Maximum replay date
    * game_map: Game map
    * game_type: Game type without spaces
    * player: Battle tag of a player
    * with_players: Whether to include player and ban data in response (bool)
  """
  def replays(opts \\ %{}) do
    default_opts = 
      %{min_id: nil, start_date: nil, end_date: nil, game_map: nil, 
      game_type: nil, player: nil, with_players: nil}

    base_url() <> "/replays?" <> url_opts(opts, default_opts)
    |> HTTPoison.get!
    |> handle_response
  end

  @doc """
  Returns replays in a paged organization
  Params:
  * opt: Map with the following keys:
    * page: Page to display, defaults to 1
    * start_date: Minimum replay date
    * end_date: Maximum replay date
    * game_map: Game map
    * game_type: Game type without spaces
    * player: Battle tag of a player
  """
  def replays_paged(opts \\ %{}) do
    default_opts = 
      %{page: nil, start_date: nil, end_date: nil, game_map: nil, 
      game_type: nil, player: nil}

    base_url() <> "/replays/paged?" <> url_opts(opts, default_opts)
    |> HTTPoison.get!
    |> handle_response
  end
end
  