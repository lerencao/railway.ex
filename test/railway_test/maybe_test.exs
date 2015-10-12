defmodule RailwayTest.MaybeTest do
  use ExUnit.Case
  doctest Railway

  test "using maybe" do
    alias Railway.Maybe
    alias Railway.Functor

    assert %Maybe{just: 2, nothing: false} = Maybe.just(1) |> Functor.lift(fn e -> e + 1 end)
    assert %Maybe{just: nil, nothing: true} = Maybe.nothing |> Functor.lift(fn e -> e + 1 end)
  end
end
