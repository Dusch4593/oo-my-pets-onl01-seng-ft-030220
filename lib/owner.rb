require 'pry'

class Owner
  # code goes here
  @@all = []
  attr_reader :name, :species 
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def species 
    @species = "human"
  end
  
  def say_species 
    "I am a #{species}."
  end
  
  def self.all 
    @@all
  end
  
  def self.count 
    all.count
  end
  
  def self.reset_all 
    all.clear
  end
  
  def cats 
    Cat.all.select { |cat| cat.owner == self }
  end
  
  def dogs 
    Dog.all.select { |dog| dog.owner == self }
  end
  
  def buy_cat(name)
    new_cat = Cat.new(name, self)
    cats << new_cat
  end
  
  def buy_dog(name)
    new_dog = Dog.new(name, self)
    dogs << new_dog
  end
  
  def walk_dogs
    dogs.each{ |dog| dog.mood = "happy" }
  end
  
  def feed_cats 
    cats.each{ |cat| cat.mood = "happy" }
  end
  
  def sell_pets 
    all_pets = cats.concat(dogs)
    all_pets.each{|pet| 
      pet.mood = "nervous" 
      pet.owner = nil
    }
  end
  
  def list_pets 
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
end