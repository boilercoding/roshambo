defmodule Roshambo do

  def main([]) do
    IO.puts("Please provide a value of 'rock', 'paper', or 'scissors'")
  end

  def main(argv) do
    argv
    |> winner_is
    |> IO.puts
  end

  def winner_is(argv) do
    argv
    |> parse_args
    |> determine_winner
  end

  defp parse_args(argv) do
    switches = [rock: :bolean, paper: :boolean, scissors: :boolean]
    parse = OptionParser.parse(argv, switches: switches)

    case parse do
      {[{switch, true}], [player_move], _} ->
        {to_string(switch), player_move}
      {_, [player_move], _} ->
        {get_cpu_move(), player_move}
    end
  end

  defp get_cpu_move do
    Enum.random(["rock", "paper", "scissors"])
  end

  defp determine_winner({"paper", "rock"}) do
    "You lost, computer played paper"
  end
  defp determine_winner({"rock", "scissors"}) do
    "You lost, computer played rock"
  end
  defp determine_winner({"scissors", "paper"}) do
    "You lost, computer played scissors"
  end
  defp determine_winner({cpu_move, player_move}) when cpu_move == player_move do
    "It was a tie - you both played #{cpu_move}"
  end
  defp determine_winner({cpu_move, _}) do
    "You win! Computer played #{cpu_move}"
  end
end
