defmodule Wabanex.IMC do
  def calculate(filename) do
    filename
    |> File.read()
    |> handle_file()
  end

  defp handle_file({:ok, content}) do
    content
    |> String.split("\n")
    |> Enum.map(fn item -> parse_item(item) end)
    |> Enum.into(%{})
  end

  defp handle_file({:error, _reason}) do
    {:error, "an error occured trying to open file"}
  end

  # defp handle_file(_) do
  #   "it seems you've passed wrong parameter"
  # end

  defp parse_item(item) do
    item
    |> String.split(",")
    |> List.update_at(1, &String.to_float/1)
    |> List.update_at(2, &String.to_float/1)
    |> calculate_imc()

    # |> IO.inspect()
  end

  defp calculate_imc([name, height, weight]), do: {name, weight / height * height}
end
