#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    playerHand = @get ('playerHand')
    @set 'dealerHand', deck.dealDealer()
    dealerHand = @get ('dealerHand')
    playerHand.on 'blackJack', -> console.log 'Jack pot'
    playerHand.on 'busted', -> console.log 'damn i lost'
    playerHand.on 'stand', -> dealerHand.dealerPlay()

    dealerHand.on 'blackJack', -> console.log 'dealer hits Jack pot'
    dealerHand.on 'busted', -> console.log 'damn dealer lost?'
    dealerHand.on 'stand', -> 
    	dealerScore = dealerHand.scores()[0]
    	playerScore = playerHand.scores()[0]
    	if dealerScore > playerScore
    		console.log 'Dealer Wins'
    	if playerScore > dealerScore
    		console.log 'Player Wins'
    	if playerScore == dealerScore
    		console.log 'Draw Game'