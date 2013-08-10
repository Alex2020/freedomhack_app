require 'spec_helper'

describe TextMessage do
  before(:all) do
  	# the :each is the default, before would work just fine
  	# This sets the instance variable @valid_attributes before
  	#the rest of the test cases are defined
  	@sample_text_message = {
  		:content => "freedom hack is awesome",
  		:receiver => "7036222002",
  		:sender => "2245209581"
  	}
  end
  # what does it do  again?  It (no pun intended) takes a block
  #which is executed in the context of the appropriate subclass
  #in which it is declared
  # Note that User.create!(@valid_attributes) is not a valid test
  # no asserts/expected equivalences were given
  it "should create a new text message given valid attributes" do
  	#User.create!(@valid_attributes)
    # That test was useless...this one actually has meaning
    lambda{
      TextMessage.create(@sample_text_message)
    }.should change(TextMessage, :count).by(1)
  end

  it "should send a text message" do 
    foo = TextMessage.create(@sample_text_message)
  	foo.send_text_message
  end
=begin
  it "should not save if first name is nil" do
    lambda {  
      p = User.create
    }.should_not change(User, :count).by(1)
  end

  it "valid_attributes user's full name should be Foo Example" do
    p = User.create(@valid_attributes)
    p.full_name.should == "Foo Example"
  end

  it "middle_name user's full name should be Foo Bar Bash" do
    p = User.create(@middle_name)
    p.full_name.should == "Foo Bar Bash"
  end
=end
	
end