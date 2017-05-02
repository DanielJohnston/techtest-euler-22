require 'name_list'

describe 'Creating a list' do
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
