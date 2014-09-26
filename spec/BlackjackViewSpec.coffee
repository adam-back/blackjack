expect = chai.expect

describe 'game', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'gameover', ->
    it "should end the game when your cards value is over 21", ->
      expect(deck.length).to.equal 50
      playerScorePreHit = hand.scores()[0]
      expect(deck.last()).to.equal hand.hit()
      expect(deck.length).to.equal 49
      expect(hand.scores()[0]).to.not.equal playerScorePreHit

