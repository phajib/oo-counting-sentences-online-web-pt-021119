require 'pry'

class String

  def sentence?
    include? "."
  end

  def question?
    include? "?"
  end

  def exclamation?
    include? "!"
  end

  def count_sentences
    #self.split((/\.|\?|\!/).delete_if {|w| w.size < 2}).size
    #include? (/[^\.!?]+[\.!?]/) #.map(&:strip).count)
    # self.count

    # Splits sentences and counts them
    self.scan(/[^\.!?]+[\.!?]/).map(&:strip).count
    # Caret inside of a character class [^ ] is the negation operator. Which means we are looking for characters which are not present in list: ., ! and ?. + is a greedy operator that returns matches between 1 and unlimited times. (capturing our sentences here and ignoring repetitions like ...) [\.!?] matching characters ., ! or ?.
    # In a nutshell, we are capturing all characters that are not ., ! or ? till we get characters that are ., ! or ?. Which basically can be treated as a sentence (in broad senses).
  end
end