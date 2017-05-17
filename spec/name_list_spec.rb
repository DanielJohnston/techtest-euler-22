require 'name_list'

describe NameList do
  it 'allows a list to be created' do
    expect{ subject }.to_not raise_error
  end

  it 'creates a one-item list' do
    name = double("name")
    list = NameList.new [name]
    expect(list.names).to eq [name]
  end

  it 'creates a five-item list' do
    name = double("name")
    names = [name, name, name, name, name]
    # stubbing out this method as it calls Name methods
    allow(names).to receive(:sort).and_return(names)
    list = NameList.new names
    expect(list.names).to eq names
  end
end

describe 'Alphabetisation' do
  it 'a created two-item list sorts its names' do
    name_1 = double("name_1")
    name_2 = double("name_2")
    # sort uses :<=> to compare items in an array
    # returning +1 means greater than
    allow(name_1).to receive(:<=>).and_return(1)
    list = NameList.new [name_1, name_2]
    expect(list.names).to eq [name_2, name_1]
  end
end

describe '#name_place_score' do
  it 'a name_score of 1 in 1st position returns 1' do
    name = double("name")
    allow(name).to receive(:name_score).and_return(1)
    names = [name]
    allow(names).to receive(:sort).and_return(names)
    list = NameList.new names
    expect(list.name_place_score(name)).to eq 1
  end

  it 'a name score of 20 in 1394th position returns 27880' do
    name_1 = double("name_1")
    allow(name_1).to receive(:name_score).and_return(20)
    name_2 = double("name_2")
    names = []
    1393.times { names << name_2 }
    names << name_1
    allow(names).to receive(:sort).and_return(names)
    list = NameList.new names
    expect(list.name_place_score(name_1)).to eq 27880
  end
end

describe '#position' do
  it 'a name in 13th position returns 13' do
    name_1 = double("name_1")
    names = []
    12.times { names << double("name_2") }
    names << name_1
    allow(names).to receive(:sort).and_return(names)
    list = NameList.new names
    expect(list.position(name_1)).to eq 13
  end
end

describe '#list_score' do
  it 'a list of 1 item with name_score of 1 returns 1' do
    name = double("name")
    allow(name).to receive(:name_score).and_return(1)
    names = [name]
    allow(names).to receive(:sort).and_return(names)
    list = NameList.new names
    expect(list.list_score).to eq 1
  end
end
