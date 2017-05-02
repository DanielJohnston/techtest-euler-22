class NameList
  def initialize names
    @names = names.sort
  end

  def names
    @names
  end

  def name_place_score name
    position = @names.index(name)+1
    position * name.name_score
  end
end
