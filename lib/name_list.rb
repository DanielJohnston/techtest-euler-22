class NameList
  def initialize names
    @names = names.sort
  end

  def names
    @names
  end

  def name_place_score name
    position(name) * name.name_score
  end

  def position name
    @names.index(name)+1
  end

  def list_score
    @names.reduce(0) do |total, name|
      total += name_place_score(name)
    end
  end
end
