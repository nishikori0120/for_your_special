class OrdersController < ApplicationController
  def index
    @user = current_user
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    unless @order.valid?
      render :new and return
    end
    session["order_data"] = {order: @order.attributes}
    session["user_data"] = {user: current_user.attributes}
    redirect_to order_select_address_path
  end

  def select_address
    @user = User.find(current_user.id)
    @address = @user.address
  end

  def add_address
    @new_address = Address.new(address_params)
    unless @new_address.valid?
      render :select_address and return
    end
    session["address_data"] = {new_address: @new_address.attributes}
    redirect_to order_comfimation_path
  end

  def comfimation
    @address = current_user.address
    if session["address_data"].present?
    @new_address = Address.new(session["address_data"]["new_address"])
    end
    @order = Order.new(session["order_data"]["order"])
  end

  def order_end
    redirect_to new_card_path and return unless current_user.card.present?

    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
    customer_token = current_user.card.customer_token # ログインしているユーザーの顧客トークンを定義
    Payjp::Charge.create(
     amount: 3000, # 商品の値段
     customer: customer_token, # 顧客のトークン
     currency: 'jpy' # 通貨の種類（日本円）
     )

    @order = Order.new(session["order_data"]["order"])
    if session["address_data"].present?
      @address = Address.new(session["address_data"]["new_address"])
      @address.save
      @order[:address_id] = Address.last.id
      @order.save
      session["address_data"]["new_address"].clear
    else
      @order[:address_id] = current_user.address.id
      @order.save
    end

    session["order_data"]["order"].clear
    session["user_data"]["user"].clear
  end


  private

  def order_params
    params.require(:order).permit(:k_name,:r_name,:birthday,:height).merge(user_id: current_user.id)
  end

  def address_params
    params.permit(:postcode,:prefecture,:city,:street,:building,:first_name, :first_name_kana, :last_name, :last_name_kana, :tel).merge(user_id: current_user.id)
  end

end
