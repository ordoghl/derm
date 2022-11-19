defmodule DermWeb.PatientView do
  use DermWeb, :view

  defimpl Phoenix.HTML.Safe, for: Range do
    def to_iodata(data), do: inspect(data)
  end

  def year_range(interval \\ 130) do
    current_year = DateTime.utc_now.year
    [current_year - interval..current_year]
  end
end
