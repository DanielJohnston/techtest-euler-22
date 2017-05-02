class Name
  # Fun fact, including Comparable here breaks the code, as the position method in
  # NameList is dependent on == matching the exact object and not the same name

  def initialize name
    raise "Names can only consist of capitalised alphabetic characters A-Z" unless name =~ /^[A-Z]*$/
    @name = name
  end

  def name
    @name
  end

  def name_score
    @name.chars.reduce(0) do |total, letter|
      total + letter_score(letter)
    end
  end

  def <=> comparator_name
    @name <=> comparator_name.name
  end

  private

  def letter_score letter
    letter.ord - 'A'.ord + 1
  end
end
