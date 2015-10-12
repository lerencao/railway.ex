defprotocol Railway.Functor do
  @spec lift(t, (term -> term)) :: t
  def lift(functor, fun)
end
