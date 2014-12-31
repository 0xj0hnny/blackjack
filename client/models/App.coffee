#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    playerHand = @get('playerHand')
    dealerHand = @get('dealerHand')
    
    playerHand.on 'blackjack', -> alert 'Blackjack! You win!'
    playerHand.on 'bust', -> alert 'Bust! Dealer wins!'
    playerHand.on 'stand', -> dealerHand.play()
    dealerHand.on 'blackjack', -> alert 'Blackjack! Dealer wins!'
    dealerHand.on 'bust', -> alert 'Bust! You win!'
    dealerHand.on 'stand', ->
      playerScore = playerHand.scores()[0]
      dealerScore = dealerHand.scores()[0]
      if playerScore > dealerScore then alert 'Dealer stands. You win!'
      if dealerScore > playerScore then alert 'Dealer stands. Dealer wins!'
      if dealerScore == playerScore then alert 'Dealer stands. It\'s a draw!'

