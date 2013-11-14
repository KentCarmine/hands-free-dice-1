class Dice

  def initialize(params)
    @num_sides = params[:num_sides]
  end


  def roll
    rand(1..@num_sides) #USE RANDOM.ORG API WHEN REST OF CODE WORKS
  end
end