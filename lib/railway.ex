defmodule Railway do
  @moduledoc """
  an implementation of railway oriented programming
  """
  defmacro bind(arg, func) do
    quote bind_quoted: [arg: arg, func: func] do
      (fn ->
        case arg do
          {:ok, x} -> x |> func.()
          {:error, _} = expr -> expr
        end
      end).()
    end
  end

  defmacro map(arg, func) do
    quote bind_quoted: [arg: arg, func: func] do
      (fn ->
        {:ok, arg |> func.()}
      end).()
    end
  end

  defmacro tee(arg, func) do
    quote bind_quoted: [arg: arg, func: func] do
      (fn ->
        arg |> func.()
        {:ok, arg}
      end).()
    end
  end

  defmacro try_catch(arg, func) do
    quote bind_quoted: [arg: arg, func: func] do
      (fn ->
        try do
          {:ok, arg |> func.()}
        rescue
          e -> {:error, e}
        end
      end).()
    end
  end
end
