fun index(s: sslice)
  s.before.count

fun show-maybe(m: maybe<a>, show-elem: a -> e string): e string
  match m
    Nothing -> "?(/)"
    Just(x) ->  "?(" ++ show-elem(x) ++ ")"

fun show(m: maybe<int>): string
  show-maybe(m, show)

fun show(t: (int, int)): string
  show-tuple(t, show, show)

fun show(m: maybe<(int, int)>): string
  show-maybe(m, show)

fun minimum-on(l: list<a>, key: a -> int): maybe<a>
  match l
    Nil -> Nothing
    Cons(x,xx) -> Just(xx.foldl(x) fn(a, b) { if a.key < b.key then a else b })

fun maximum-on(l: list<a>, key: a -> int): maybe<a>
  match l
    Nil -> Nothing
    Cons(x,xx) -> Just(xx.foldl(x) fn(a, b) { if a.key > b.key then a else b })

