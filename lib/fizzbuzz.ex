defmodule FizzBuzz do
  def build(filename) do
    filename |> File.read() |> handle_file()
  end

  defp handle_file({:ok, result}) do
    result =
      result
      |> String.split(",")
      |> Enum.map(&convert_and_evaluate/1)

    # Enum.map(list, fn number -> String.to_integer(number) end) | Without pipes example
    {:ok, result}
  end

  defp handle_file({:error, error}), do: {error, "error reading the file: #{error}"}

  defp convert_and_evaluate(elem) do
    elem
    |> String.to_integer()
    |> evaluate_numbers()
  end

  # Guards flow
  defp evaluate_numbers(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :fizzbuzz
  defp evaluate_numbers(number) when rem(number, 3) == 0, do: :fizz
  defp evaluate_numbers(number) when rem(number, 5) == 0, do: :buzz
  defp evaluate_numbers(number), do: number
end
