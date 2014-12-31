# Rules
- Closest to 21 without going over
  - A: 1 or 11 (whichever works best)
  - 2..9: face value
  - 10..K: 10
- Player actions to implement
  - hit (player draws another card)
  - stand (player stops at current total)

# Order of play

1. Deal 2 cards to player
2. Deal 2 cards to dealer
3. Reveal 1 dealer card
4. While player is not done
  - player 'hit': deal another card.
    - if playerScore > 21, player is done (player loses, dealer wins)
  - player 'stays': player is done, continue to dealer
5. While dealer is not done
  - if dealerScore < 17, dealer 'hit'
  - if dealerScore > 21, dealer is done (player wins, dealer loses)
6. If neither player nor dealer busts, compare playerScore to dealerScore. Assign winner accordingly.