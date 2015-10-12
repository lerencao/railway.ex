
defmodule Railway.Maybe do
  @type t :: %__MODULE__{
    just: term,
    nothing: boolean
  }

  defstruct just: nil, nothing: false

  def just(v), do: struct(__MODULE__, just: v, nothing: false)
  def nothing, do: struct(__MODULE__, nothing: true)
end


alias Railway.Maybe
alias Railway.Functor
alias Railway.Monad

defimpl Functor, for: Maybe do
  def lift(%Maybe{nothing: true} = functor, _), do: functor
  def lift(%Maybe{just: elem}, fun) do
    fun |> apply([elem])
        |> Maybe.just
  end
end

defimpl Monad, for: Maybe do
  def bind(%Maybe{nothing: true} = f, _), do: f
  def bind(%Maybe{just: elem}, f) do
    f |> apply([elem])
  end
end
