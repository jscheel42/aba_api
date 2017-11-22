defmodule AbaAPI.Util do
  @doc """
  Returns base url
  """
  def base_url() do
    "http://hotsapi.net/api/v#{AbaAPI.api_version}"
  end

  def replace_spaces(str, new_char \\ "%20") do
    String.replace(str, " ", new_char)
  end

  @doc """
  Verifies the requested options are valid and formats them for REST api.
  """
  def url_opts(map, defaults) do
    merge_defaults(map, defaults)
    |> remove_nils
    |> gen_opt_list
    |> concat_opts
  end

  # Merges map with defaults, uses defaults where no value assigned to key
  defp merge_defaults(map, defaults) do
    Map.merge(defaults, map, fn _key, default, val -> val || default end)
  end

  # Removes entries with nil values, returns a list of tuples
  defp remove_nils(map) do
    Enum.filter map, fn { _key, val } -> val end
  end

  # Transforms opts into rest friendly strings
  defp gen_opt_list(list) do
    Enum.reduce list, [], fn { key, val }, acc ->
      acc ++ ["#{key}=#{val}"]
    end
  end

  # Combines opts into a single string
  defp concat_opts(list) do
    Enum.join(list, "&") <> "&"
  end

  @doc """
  Handles and transforms response from API.
  """
  def handle_response(%{status_code: 200, body: body}) do
    { :ok, Poison.Parser.parse!(body) }
  end

  def handle_response(%{status_code: _, body: body}) do
    { :error, Poison.Parser.parse!(body) }
  end
end
