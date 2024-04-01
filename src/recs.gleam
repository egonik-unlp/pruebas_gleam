import gleam/io
import gleam/int
import gleam/list

pub fn main() {
  let listita = build_random_list_of_lists()
  io.debug(listita)
  list.each(listita, fn(lista) {
    io.debug(lista)
    let res = recursion_test(0, lista)
    io.debug(res)
  })
}

fn build_random_list_of_lists() -> List(_) {
  let number_of_inner = int.random(10)
  let number_of_nodes = int.random(20)
  io.debug(number_of_inner)
  io.debug(number_of_nodes)
  let res =
    list.map(list.range(1, number_of_inner), fn(_) {
      list.range(1, number_of_nodes)
      |> list.map(fn(_) { int.random(10) })
    })
  res
}

fn recursion_test(accum: Int, list: List(Int)) -> Int {
  case list {
    [] -> accum + 1
    [first, ..rest] -> recursion_test(accum + first, rest)
  }
}
