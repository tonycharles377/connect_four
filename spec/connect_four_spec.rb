require './lib/connect_four'

describe ConectFour do
    describe '#initialize' do
        context "when game is initialized with default values" do
            subject {described_class.new}

            it "player_1 is X" do
                expect(subject.player_1).to eql('X')
            end

            it "player_2 is O" do
                expect(subject.player_2).to eql('O')
            end
        end

        context "when game is initialized with values" do
            let(:player_1) {"human"}
            let(:player_2) {"computer"}
            
            subject {described_class.new(player_1, player_2)}
            it "player_1 is human" do
                expect(subject.player_1).to eql(player_1)
            end

            it "player_2 is computer" do
                expect(player_2).to eql('computer')
            end
        end
    end

    describe "#index" do
        it "convert player position to actual arr position" do
            allow_any_instance_of(Kernel).to receive(:gets).and_return("3")
            expect(subject.index).to eql(2)
        end
    end

    describe '#turns_taken' do
        let(:board) {subject.board}
        it "returns the number of turns taken in the game" do
            expect(subject.turns_taken).to eql(board.count{|box| box != ""})
        end
    end

    describe '#current_player' do
        context "when #turns_taken returns an even number" do  
            it "is player X's turn" do
                allow(subject).to receive(:turns_taken).and_return(2)
                expect(subject.current_player).to eql('X')
            end
        end

        context "when #turns_taken returns an odd number" do
            it "is player O's turn" do
                allow(subject).to receive(:turns_taken).and_return(1)
                expect(subject.current_player).to eql('O')
            end
        end
    end
end