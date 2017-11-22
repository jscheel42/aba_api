defmodule AbaAPI.Hero do  
  @moduledoc """
  Uses Hero API v#{AbaAPI.api_version} API.
  """

  import AbaAPI.Util

  @doc """
  Returns ability for hero
  Params:
  * hero: Hero name, or short name, or id
  * ability: Ability hotkey
  """
  def ability(hero, ability) do
    base_url() <> "/heroes/#{hero}/abilities/#{ability}"
    |> HTTPoison.get!
    |> handle_response
  end

  @doc """
  Returns one hero.
  Params:
  * hero: Hero name, or short name, or id
  """
  def hero(hero) do
    base_url() <> "/heroes/#{hero}"
    |> HTTPoison.get!
    |> handle_response
  end

  @doc """
  Returns all heroes.
  """
  def heroes() do
    base_url() <> "/heroes"
    |> HTTPoison.get!
    |> handle_response
  end
end
  