class window.Hand extends Backbone.Collection

  model: Card

  scoreStore: 0

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop()).last()
    if(@scores()[0] > 21)
      @gameDecision('dealerWon')

  stand: (score) ->
    @models[0].flip()
    @dealerAI(score)

  playerScore: ->
    @scoreStore = @scores()[0]

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

  dealerAI: (score) ->
    dealerScore = @scores()[0]

    if dealerScore > 21
      @gameDecision('playerWon')
      return

    if score < dealerScore
      @gameDecision('dealerWon')
      return

    if dealerScore < 17 && dealerScore < score
        @hit()
        @dealerAI(score)
    else if dealerScore < 17 && dealerScore > score
        @gameDecision('dealerWon')
        return

    if dealerScore is 17
      if score > dealerScore
        @gameDecision('playerWon')
        return
      else if score < dealerScore
        @gameDecision('dealerWon')
        return

    if dealerScore > 17 < score
      @gameDecision('playerWon')
      return

    if dealerScore is score
      @gameDecision('push')
      return

  gameDecision: (decision) ->
    if decision is 'dealerWon'
      console.log('You lose!')
      setTimeout (->
        location.reload()
        return
      ), 2000
    if decision is 'playerWon'
      # alert 'You win!'
      console.log('You Win!')
      setTimeout (->
        location.reload()
        return
      ), 2000
    if decision is 'push'
      # alert 'Push! House wins'
      console.log('Push House Wins!')
      setTimeout (->
        location.reload()
        return
      ), 2000






