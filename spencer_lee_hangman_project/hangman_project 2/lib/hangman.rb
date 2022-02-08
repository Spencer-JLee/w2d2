class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    arr = []

    @secret_word.each_char.with_index do |n, i|
      arr.push(i) if n == char
    end

    arr
  end

  def fill_indices(char, arr)
    arr.each do |n|
      @guess_word[n] = char
    end
  end

  def try_guess(char)
    if already_attempted?(char)
      p "That has already been attempted"
      return false
    else 
      @attempted_chars.push(char)
      if get_matching_indices(char).length < 1
        @remaining_incorrect_guesses -= 1
      else
        arr = get_matching_indices(char)
        fill_indices(char, arr)
      end
      return true
    end
  end

  def ask_user_for_guess
    p "Enter a char: "
    response = gets.chomp
    try_guess(response)
  end

  def win?
    if @secret_word == @guess_word.join("")
      p 'WIN'
      return true
    end
    false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p 'LOSE'
      return true
    end
    false
  end

  def game_over?
    if self.win? || self.lose?
      p @secret_word
      return true
    end
    false
  end
end
