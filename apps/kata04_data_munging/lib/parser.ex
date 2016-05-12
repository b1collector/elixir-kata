defmodule Parser do
  @callback parse_stream(Enumerable.t) :: list(%{})
end
