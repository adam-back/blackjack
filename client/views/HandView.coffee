class window.HandView extends Backbone.View

  className: 'hand'

  #todo: switch to mustache
  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>'

  initialize: ->
    @collection.on 'add remove change', =>
      @render()
      @checkPlayerScore(@collection.scores()[0])
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @collection
    if @collection.scores()[0] <= 21
      @$el.append @collection.map (card) ->
        new CardView(model: card).$el
      @$('.score').text @collection.scores()[0]
    else
      @$el.append @collection.map (card) ->
        new CardView(model: card).$el
      @$('.score').text "Bust!"

  checkPlayerScore: (score) ->
    if score > 21
      alert "You Lost!"
    if score is 21
      alert "You hit 21"
