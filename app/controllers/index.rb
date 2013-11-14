get '/' do
  erb :index
end

post '/roll' do
  dice_code = params[:dice_box]
  # parsed_dice_code = DiceCodeParser.parse(dice_code).flatten # REMOVE FLATTED WHEN REGEX UPDATED

  result = DicePool.new(dice_code).roll

  display_result(result)
end
