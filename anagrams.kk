fun insert(l: list<char>, v: char) : div list<char>
  match l
    Nil -> [v]
    Cons(x,xx) -> if x < v then Cons(v,Cons(x,xx)) else Cons(x, insert(xx, v))

fun insertion-sort(l : list<char>, acc : list<char> = []) : div list<char>
  match l
    Nil -> acc
    Cons(x, xx) -> insertion-sort(xx, acc.insert(x))

fun anagrams(s : string, candidates : list<string>) : div list<string>
  val s' = s.to-lower.list.insertion-sort.string
  with c <- candidates.filter-map
  if c.to-lower.list.insertion-sort.string == s' then Just(c) else Nothing

fun main()
  anagrams("bro", ["orb", "or", "bbor", "bor"]).map(println)
