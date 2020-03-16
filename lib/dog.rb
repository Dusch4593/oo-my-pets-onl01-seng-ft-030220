class Dog
  # code goes here
  @@all = []
  attr_accessor :owner, :mood 
  attr_reader :name 
  
  def initialize(name, owner)
    @name = name 
    @owner = Owner.new(owner).name 
    @mood = "nervous"
    @@all << self
  end
  
  def self.all 
    @@all 
  end
end