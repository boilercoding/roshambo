defmodule Roshambo do

  def main([]) do
    IO.puts("Please provide a value of 'rock', 'paper', or 'scissors'")
  end

  def main(argv) do
    player_move = List.first(argv)
    play(player_move)
  end

  defp play(player_move) do
    get_cpu_move()
    |> determine_winner(player_move)
    |> IO.puts
  end

  defp get_cpu_move do
    Enum.random(["rock", "paper", "scissors"])
  end

  defp determine_winner("paper", "rock") do
    "You lost, computer played paper"
  end
  defp determine_winner("rock", "scissors") do
    "You lost, computer played rock"
  end
  defp determine_winner("scissors", "paper") do
    "You lost, computer played scissors"
  end
  defp determine_winner(cpu_move, player_move) when cpu_move == player_move do
    "It was a tie - you both played #{cpu_move}"
  end
  defp determine_winner(cpu_move, _) do
    "You win! Computer played #{cpu_move}"
  end
end
