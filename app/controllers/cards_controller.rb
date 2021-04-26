class CardsController < ApplicationController

  def new

  end

   def create
   Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
   customer = Payjp::Customer.create(
   description: 'test',
   card: params[:card_token]
   )

 card = Card.new( # トークン化されたカード情報を保存する
     card_token: params[:card_token], # カードトークン
     customer_token: customer.id, # 顧客トークン
     user_id: current_user.id # ログインしているユーザー
   )
   if card.save
    redirect_to root_path
  else
    render :'new' # カード登録画面
  end
 end

 def purchase
  Payjp.api_key = "sk_test_7dd35cada75e48f198236a04"
  Payjp::Charge.create(
    amount: 809, # 決済する値段
    card: params['payjp-token'], # フォームを送信すると作成・送信されてくるトークン
    currency: 'jpy'
  )
end

end