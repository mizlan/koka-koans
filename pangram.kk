fun pangram(s)
  with c <- all(list('a', 'z'))
  s.to-lower.contains(c.string)

  
pub fun main()
  println(pangram("The quick brown fox jumps over the lazy dog"))
  println(pangram("abwequefpzsdk,vnzmwayefgqluiwfq;oixrhczfvzn,z,kJTTT"))
  println(pangram("not a pangram"))
