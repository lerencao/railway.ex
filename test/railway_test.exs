defmodule RailwayTest do
  use ExUnit.Case
  doctest Railway

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "when ok, bind works" do
    require Railway
    assert {:ok, 1} |> Railway.bind(&add_one/1) == 2
  end

  test "when fail, bind works" do
    require Railway
    assert {:error, 1} == {:error, 1} |> Railway.bind(&add_one/1)
  end

  defp add_one(elem) do
    elem + 1
  end
end
