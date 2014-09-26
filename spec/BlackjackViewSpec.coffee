expect = chai.expect

describe 'game', ->
  deck = null
  hand = null
  dealer = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()
    dealer = deck.dealDealer()

  describe 'gameover', ->
    it "player score should increase after hit", ->
      expect(deck.length).to.equal 48
      playerScorePreHit = hand.scores()[0]
      expect(deck.last()).to.equal hand.hit()
      expect(deck.length).to.equal 47
      expect(hand.scores()[0]).to.not.equal playerScorePreHit


    it "should disable the hit button when the player busts", ->
      hand.scores()[0] = 21
      expect(hand.scores()[0]).to.equal 21

    xit "should end the game when your card's value is over 21", ->

    xit "should win when the player hits 21", ->

    xit "should end the game when dealer hits 21", ->

    xit "should end the game when dealer busts", ->

    it "dealer should increase score after hit", ->
      expect(deck.length).to.equal 48
      dealerScorePreHit = dealer.scores()[0]
      expect(deck.last()).to.equal dealer.hit()
      expect(deck.length).to.equal 47
      expect(dealer.scores()[0]).to.not.equal dealerScorePreHit

    xit "dealer should hit under 17", ->
      expect(dealer.scores()[0])

    xit "dealer should stay on 17", ->

    xit "should check whether the deal or player won when the deal stays on 17", ->

