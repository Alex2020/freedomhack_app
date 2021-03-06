require 'spec_helper'

describe TextMessage do
  before(:all) do
  	# the :each is the default, before would work just fine
  	# This sets the instance variable @valid_attributes before
  	#the rest of the test cases are defined
    foobash = TextMessage.generate_random_string
  	@sample_text_message = {
  		:content => ("freedom hack is awesome" + " " + foobash),
  		:receiver => "6302207435",
  		:sender => "2245209581",
      :secret_code => foobash
  	}
    @test_number = "+122222"
    @the_string_to_split = "foooo@bash"
    @string_to_text = "foofoo bashbash"
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

  it "should return a string of length 6" do
  	bash = TextMessage.generate_random_string
  	bash.length.should == 6
  end

  it "should chop off the first two numbers" do
    foo = TextMessage.verify_incoming_phone_number(@test_number)
    foo.should == "22222"
  end
  it "should return the last part of the string" do
    foo = TextMessage.get_location(@the_string_to_split)
    foo.should == "bash"  
  end

  it "should return foofoo" do
    TextMessage.reconstruct_secret_code(@string_to_text, 0).should == "foofoo"
  end
  it "shouldnt be pathalogical" do
    TextMessage.does_another_message_exist("bobobobobo").should == false
  end

  it "should go through bro" do
    TextMessage.find_a_response(nil, "FFFFF")
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