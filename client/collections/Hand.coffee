class window.Hand extends Backbone.Collection

  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop()).last()
    if @scores()[0] > 21 
      @trigger 'busted'
    if @scores()[0] == 21
      @trigger 'blackJack'

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    hasAce = @reduce (memo, card) ->
      memo or card.get('value') is 1
    , false
    score = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'value' else 0
    , 0
    if hasAce then [score, score + 10] else [score]

  stand: -> 
    @trigger 'stand'

  dealerPlay: -> 
    @first().flip()
    while @scores()[0] < 17
      @hit()
    if @scores()[0] >= 17 and @scores()[0] < 21
      @stand()
  #busted: ->
  #  @trigger console.log 'You are busted' if @scores()[0] > 21 
#
  #blackJack: -> 
  #  @trigger console.log 'Black Jack!' if @scores()[0] = 21 