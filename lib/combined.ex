defmodule Combined do
  import Drop
  import Convert


  def height_to_mph(meters) do
    fall_velocity(meters) |> mps_to_mph
  end
end
