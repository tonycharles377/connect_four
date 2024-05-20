class ConectFour
    attr_accessor :player_1, :player_2, :board

    def initialize(player_1='X', player_2='O')
        @player_1 = player_1
        @player_2 = player_2
        @board = Array.new(42, "")
    end

    def display_board
        puts " | #{@board[35]} | #{@board[36]} | #{@board[37]} | #{@board[38]} | #{@board[39]} | #{@board[40]} | #{@board[41]} |"
        puts " ----------------------"
        puts " | #{@board[28]} | #{@board[29]} | #{@board[30]} | #{@board[31]} | #{@board[32]} | #{@board[33]} | #{@board[34]} |"
        puts " ----------------------"
        puts " | #{@board[21]} | #{@board[22]} | #{@board[23]} | #{@board[24]} | #{@board[25]} | #{@board[26]} | #{@board[27]} |"
        puts " ----------------------"
        puts " | #{@board[14]} | #{@board[15]} | #{@board[16]} | #{@board[17]} | #{@board[18]} | #{@board[19]} | #{@board[20]} |"
        puts " ----------------------"
        puts " | #{@board[7]} | #{@board[8]} | #{@board[9]} | #{@board[10]} | #{@board[11]} | #{@board[12]} | #{@board[13]} |"
        puts " ----------------------"
        puts " | #{@board[0]} | #{@board[1]} | #{@board[2]} | #{@board[3]} | #{@board[4]} | #{@board[5]} | #{@board[6]} |"
    end

    # Convert selected player position to actual array position
    def index
        puts "Player #{current_player} enter numbers betweeen 1 to 42"
        user_input = gets.chomp

        position = user_input.to_i > 0 && user_input.to_i <= 42 ? user_input.to_i - 1 : index
    end

    # Counts the number of turns taken
    def turns_taken
        @board.count { |box| box != ""}
    end

    def current_player
        turns_taken.even? ? @player_1 : @player_2
    end

    def make_move
        @board[index] = current_player
    end
end