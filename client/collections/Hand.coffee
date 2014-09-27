class window.Hand extends Backbone.Collection

  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop()).last()

  stand: ->
    @models[0].flip()
    @dealerAI()

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

  dealerAI: ->
    # loop
    # console.log()
    dealerHit = true
    #get the dealer's value
    while dealerHit
      if @scores()[0] < 17
        @hit()
      else if @scores()[0] is 17
        # make game decision
        dealerHit = false
      else
        # make game decision
        dealerHit = false
