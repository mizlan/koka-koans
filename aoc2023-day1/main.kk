import std/os/file
import std/os/path
import utils

fun first-and-last(s : string)
  val digs = s.list.filter-map fn(c) { c.string.parse-int }
  match (digs.head, digs.last)
    (Just(a), Just(b)) -> Just( (a, b) )
    _ -> Nothing

fun part-one(s)
  val nums = s.lines.filter-map(first-and-last)
  nums.map(fn( (a, b) ) { a * 10 + b }).sum

fun first-and-last-p2(s: string)
  val word-digs = [("one", 1), ("two", 2), ("three", 3), ("four", 4), ("five", 5), ("six", 6), ("seven", 7), ("eight", 8), ("nine", 9)]
  val digs = word-digs ++ list(1, 9).map(fn(i) { (i.show, i) })
  val first-candidates = digs.filter-map(fn( (w, d) ) { s.find(w).map(fn(ss) -> (ss.index, d)) })
  val last-candidates = digs.filter-map(fn( (w, d) ) { s.find-last(w).map(fn(ss) -> (ss.index, d)) })
  val a = first-candidates.minimum-on(fst)
  val b = last-candidates.maximum-on(fst)
  match (a, b)
    (Just((_, d1)), Just((_, d2))) -> Just( (d1, d2) )
    _ -> Nothing

fun part-two(s)
  val nums = s.lines.filter-map(first-and-last-p2)
  nums.map(fn( (a, b) ) { a * 10 + b }).sum

pub fun main()
  println(part-one(read-text-file("input".path)))
  println(part-two(read-text-file("input".path)))
