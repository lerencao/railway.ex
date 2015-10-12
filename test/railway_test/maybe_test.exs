defmodule RailwayTest.MaybeTest do
  use ExUnit.Case
  doctest Railway

  test "using maybe" do
    alias Railway.Maybe
    alias Railway.Functor

    assert %Maybe{just: 2, nothing: false} = Maybe.just(1) |> Functor.lift(fn e -> e + 1 end)
    assert %Maybe{just: nil, nothing: true} = Maybe.nothing |> Functor.lift(fn e -> e + 1 end)
  end

  test "test maybe Monad" do
    alias Railway.Maybe
    alias Railway.Monad
    f = fn e -> if (e > 0), do: Maybe.just(e + 1), else: Maybe.nothing end
    assert %Maybe{just: nil, nothing: true} = Maybe.nothing |> Monad.bind(f)
    assert %Maybe{just: 2, nothing: false} = Maybe.just(1) |> Monad.bind(f)
    assert %Maybe{just: nil, nothing: true} = Maybe.just(0) |> Monad.bind(f)
  end
end
