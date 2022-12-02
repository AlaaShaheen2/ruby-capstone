require '../label'

describe Label do
  before :each do
    @label = Label.new('Coding', 'blue')
  end

  it 'This should return a label' do
    expect(@label).to be_an_instance_of Label
  end

  it 'The title for the label is : ' do
    expect(@label.title).to eq 'Coding'
  end

  it 'The label color is:' do
    expect(@label.color).to eq 'blue'
  end
end
