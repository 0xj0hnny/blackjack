#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    playerHand = @get ('playerHand')
    @set 'dealerHand', deck.dealDealer()
    dealerHand = @get ('dealerHand')
    playerHand.on 'stand', -> console.log 'trigger happened'
    playerHand.on 'blackjack', -> console.log 'Jack pot'
    playerHand.on 'busted', -> console.log 'damn i lost'