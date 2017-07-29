defmodule RoshamboTest do
  use ExUnit.Case
  doctest Roshambo

  test "paper beats rock" do
    assert Roshambo.winner_is(["rock", "--paper"]) == "You lost, computer played paper"
  end

  test "paper losses to scissors" do
    assert Roshambo.winner_is(["scissors", "--paper"]) == "You win! Computer played paper"
  end

  test "paper ties with paper" do
    assert Roshambo.winner_is(["paper", "--paper"]) == "It was a tie - you both played paper"
  end
end
