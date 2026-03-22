# The game board represented as a list.
board = [" " for _ in range(9)]

def print_board():
    """Prints the current state of the game board."""
    print("-------------")
    print(f"| {board[0]} | {board[1]} | {board[2]} |")
    print("-------------")
    print(f"| {board[3]} | {board[4]} | {board[5]} |")
    print("-------------")
    print(f"| {board[6]} | {board[7]} | {board[8]} |")
    print("-------------")

def check_win(player):
    """
    Checks for all possible winning conditions for a given player.
    Returns True if the player has won, otherwise False.
    """
    # Check rows
    for i in range(0, 9, 3):
        if board[i] == board[i+1] == board[i+2] == player:
            return True
    # Check columns
    for i in range(3):
        if board[i] == board[i+3] == board[i+6] == player:
            return True
    # Check diagonals
    if board[0] == board[4] == board[8] == player:
        return True
    if board[2] == board[4] == board[6] == player:
        return True
    return False

def check_draw():
    """
    Checks if the game is a draw.
    Returns True if the board is full, otherwise False.
    """
    return " " not in board

def play_game():
    """Main function to run the tic-tac-toe game."""
    current_player = "X"
    game_over = False

    while not game_over:
        print_board()
        try:
            position = int(input(f"Player {current_player}, enter a position (1-9): ")) - 1
            if 0 <= position <= 8 and board[position] == " ":
                board[position] = current_player

                if check_win(current_player):
                    print_board()
                    print(f"Player {current_player} wins!")
                    game_over = True
                elif check_draw():
                    print_board()
                    print("It's a draw!")
                    game_over = True
                else:
                    current_player = "O" if current_player == "X" else "X"
            else:
                print("Invalid move. The space is already taken or the number is out of range. Try again.")
        except ValueError:
            print("Invalid input. Please enter a number from 1 to 9.")

if __name__ == "__main__":
    play_game()