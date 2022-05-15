defmodule FizzBuzzTest do
  use ExUnit.Case

  describe "build/1" do
    test "when a valid file is provided, returns the converted list" do
      expected_response = {:ok, [1, :buzz, :fizz, :fizzbuzz, 22]}
      assert FizzBuzz.build("number.txt") == expected_response
    end

    test "when an invalid file is provided, returns an error" do
      expected_response = {:enoent, "error reading the file: enoent"}
      assert FizzBuzz.build("errorfile.txt") == expected_response
    end
  end
end
