defmodule Day1 do

  def total_calories(list) do
    list
    |> per_elf()
    |> elf_total()
    |> Enum.reduce(&max/2)
  end

  def per_elf(list) do
    String.split(list, "\n\n")
  end

  def elf_total(list_elf) do
    list_elf
    |> Enum.map(fn string_collection -> string_collection
    |> String.split("\n")
    |> Enum.reject(fn value -> value == "" end)
    |> Enum.map(fn string_value -> String.to_integer(string_value) end)
    |> Enum.sum()
    end)
  end

  def elf_top_3(list) do
    list
    |> per_elf()
    |> elf_total()
    |> Enum.sort()
    |> Enum.reverse()
    |> Enum.take(3)
    |> Enum.sum()
  end

  def read_file do
    File.read!("puzzle-input/day1.txt")
  end

end

list = Day1.read_file()
result1 = Day1.total_calories(list)
result2 = Day1.elf_top_3(list)

IO.puts("Answer 1: #{result1}")
IO.puts("Answer 2: #{result2}")
