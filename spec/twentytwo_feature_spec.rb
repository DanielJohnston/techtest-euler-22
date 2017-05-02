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
