shared :set_difference do |klass, cmd|
  describe "#{klass}##{cmd}" do
    before :each do
      @set = klass[:a, :b, :c]
    end
    
    it "returns a new Set containting self's elements excluding the elements in the passed Enumerable" do
      @set.send(cmd, Set[:a, :b]).should == klass[:c]
      @set.send(cmd, [:b, :c]).should == klass[:a]
    end
    
    it "raises an ArgumentError when passed a non-Enumerable" do
      lambda { @set.send(cmd, 1) }.should raise_error(ArgumentError)
      lambda { @set.send(cmd, Object.new) }.should raise_error(ArgumentError)
    end
  end
end
