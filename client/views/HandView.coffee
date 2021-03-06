class window.HandView extends Backbone.View

  className: 'hand'

  #todo: switch to mustache
  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>'

  initialize: ->
    @collection.on 'add remove change', =>
      @render()
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @collection
    if @checkScore(@collection.scores()[0]) is 'bust'
      @$el.append @collection.map (card) ->
        new CardView(model: card).$el
      @$('.score').text 'Bust!'
    else if @checkScore(@collection.scores()[0]) is 'blackjack'
      @$el.append @collection.map (card) ->
        new CardView(model: card).$el
      @$('.score').text 'Blackjack!'
    else
      @$el.append @collection.map (card) ->
        new CardView(model: card).$el
      @$('.score').text @collection.scores()[0]

  checkScore: (score) ->
    if score > 21
      return 'bust'
    if score is 21
      return 'blackjack'
    if score < 21
      return 'play'

