require 'name'

describe 'Creating a name' do
  it 'allows a name to be created' do
    expect{ subject }.to_not raise_error
  end

  it 'stores a created name' do
    name = Name.new "BORIS"
    expect(name.name).to eq "BORIS"
  end

  it "raises an error if a name isn't given" do
    expect{ Name.new }.to raise_error(ArgumentError)
  end

  it "raises an error if a name includes numbers" do
    expect{ Name.new "3JANE" }.to raise_error "Names can only consist of capitalised alphabetic characters A-Z"
  end

  it "raises an error if a name includes non-caps alphabetic characters" do
    expect{ Name.new "Boris" }.to raise_error "Names can only consist of capitalised alphabetic characters A-Z"
  end

  it "raises an error if a name includes spaces" do
    expect{ Name.new "BOR IS" }.to raise_error "Names can only consist of capitalised alphabetic characters A-Z"
  end

  it "raises an error if a name includes non-alphabetic symbols" do
    expect{ Name.new "BOR£$%^S" }.to raise_error "Names can only consist of capitalised alphabetic characters A-Z"
  end
end

describe '#name_score' do
  it "returns 1 for A" do
    name = Name.new "A"
    expect(name.name_score).to eq 1
  end

  it "returns 2 for B" do
    name = Name.new "B"
    expect(name.name_score).to eq 2
  end

  it "returns 26 for Z" do
    name = Name.new "Z"
    expect(name.name_score).to eq 26
  end

  it "returns 3 for AB" do
    name = Name.new "AB"
    expect(name.name_score).to eq 3
  end

  it "returns 53 for COLIN" do
    name = Name.new "COLIN"
    expect(name.name_score).to eq 53
  end
end
