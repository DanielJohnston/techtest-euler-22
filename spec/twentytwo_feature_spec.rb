Dir[File.expand_path('../lib/*.rb', __FILE__)].each do |file|
  require file
end

describe 'Alphabetise a list' do
  it 'a created list of 10 names is automatically alphabetised' do
    a = Name.new("BORIS")
    b = Name.new("ARTHUR")
    c = Name.new("ZANDAR")
    d = Name.new("OXBOW")
    e = Name.new("LA")
    f = Name.new("ALVYN")
    g = Name.new("BORIT")
    h = Name.new("JAMES")
    i = Name.new("KELLY")
    j = Name.new("JUNE")
    names = [a, b, c, d, e, f, g, h, i, j]
    list = NameList.new(names)
    expect(list.names).to eq [f, b, a, g, h, j, i, e, d, c]
  end
end

describe 'Calculate the name_place_score of a name in a list' do
  it "COLIN as 938th name in a list has a score of 49714" do
    names = []
    937.times do
      names << Name.new("ARTHUR")
    end
    colin = Name.new("COLIN")
    names << colin
    list = NameList.new(names)
    expect(list.name_place_score(colin)).to eq 49714
  end
end
