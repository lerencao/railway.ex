defmodule RailwayTest do
  use ExUnit.Case
  doctest Railway

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "when ok, bind works" do
    require Railway

    assert validate_positive(1) |> Railway.bind(&validate_positive/1) == {:ok, 1}
  end

  test "when fail, bind works" do
    require Railway
    assert {:error, _} = validate_positive(-1) |> Railway.bind(&validate_positive/1)
  end

  defp validate_positive(data) do
    if data > 0 do
      {:ok, data}
    else
      {:error, "the input should be positive"}
    end
  end
end
