defprotocol Railway.Functor do
  @spec lift(t, (term -> term)) :: t
  def lift(functor, fun)
end
defprotocol Railway.Monad do
  @spec bind(t, (term -> t)) :: t
  def bind(m, fun)
end
