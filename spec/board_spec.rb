require 'board'

describe Board do 
  let(:board) { Board.new }

  describe "#gameover?" do
    context "given #line_match? being 'true'" do
      it "returns the winner" do
        allow(board).to receive(:line_match?).and_return(true)
        expect(board.gameover?).to eql(board.turn)
      end
    end

    context "given #line_match being true and #tie? being 'true'" do
      it "returns 'tie'" do
        allow(board).to receive(:line_match?).and_return(false)
        allow(board).to receive(:tie?).and_return(true)
        expect(board.gameover?).to eql("tie")
      end
    end

    context "given both #line_match? and #tie? being 'false" do
      it "returns 'false'" do
        allow(board).to receive(:line_match?).and_return(false)
        allow(board).to receive(:tie?).and_return(false)
        expect(board.gameover?).to eql(false)
      end
    end
  end

  describe "#switch" do
    context "given 'O' as initial turn" do
      it "changes turn to 'X' and returns it" do
        expect(board.turn).to eql("Ｏ")
        board.send(:switch)
        expect(board.turn).to eql("Ｘ")
      end
    end
  end

  describe "#draw" do
    context "given index number" do
      it "draws at the specific space" do
        turn = board.turn
        board.send(:draw, 8)
        expect(board.instance_variable_get(:@blocks)[8]).to eql(turn)
      end
    end
  end
end