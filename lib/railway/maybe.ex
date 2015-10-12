defmodule Railway.Maybe do
  @type t :: %__MODULE__{
    just: term,
    nothing: boolean
  }

  defstruct just: nil, nothing: false

  def just(v), do: struct(__MODULE__, just: v, nothing: false)
  def nothing, do: struct(__MODULE__, nothing: true)
end


defimpl Railway.Functor, for: Railway.Maybe do
  alias Railway.Maybe
  def lift(%Maybe{nothing: true} = functor, _), do: functor
  def lift(%Maybe{just: elem}, fun) do
    fun |> apply([elem])
        |> Maybe.just
  end
end
