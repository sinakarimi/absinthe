defmodule Elixir.Absinthe.Integration.Execution.InputTypes.Null.VariableToTypeNonNullListOf_TElementTest do
  use ExUnit.Case, async: true

  @query """
  query ($value: [Int!]) {
    nullableListOfNonNullableType(input: $value) {
      length
      content
      nonNullCount
      nullCount
    }
  }
  """

  test "scenario #1" do
    assert {:ok, %{errors: [%{message: "Argument \"input\" has invalid value $value.\nIn element #1: Expected type \"Int!\", found null.",
                              locations: [%{column: 33, line: 2}]}]}} == Absinthe.run(@query, Absinthe.Fixtures.NullListsSchema, [variables: %{"value" => [nil, 1]}])
  end
end
