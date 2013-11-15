get '/' do
  erb :index
end

post '/roll' do
  # puts "ROLL TYPE #{params[:roll_type]}"
  roll_type = params[:roll_type].strip
  dice_code = params[:dice_box]

  # puts "ROLL TYPE: #{roll_type}"
  # parsed_dice_code = DiceCodeParser.parse(dice_code).flatten # REMOVE FLATTED WHEN REGEX UPDATED

  # puts "CLIENT SENT:"
  # p dice_code

  result = DicePool.roll(dice_code, roll_type)

  if roll_type == "standard"
    display_standard_result(result)
  elsif roll_type == "10_again"
    display_10_again_result(result)
  else
    "NOT VALID ROLL MODE"
  end
end

get '/results_frame' do

 erb :_results_frame
end
