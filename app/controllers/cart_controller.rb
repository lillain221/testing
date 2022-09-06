class CartController < ApplicationController
  before_action :prevent_url, only: [:confirm, :order_summery]
  before_action :blank_url, only: [:order_summery]
  def add
    @property = Property.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    size = params[:size].to_i
    current_cart_item = @cart.cart_items.find_by(property_id: @property.id,size: size)
    if current_cart_item && quantity > 0 
      current_cart_item.update(quantity:)
      current_cart_item.update(size:)
    elsif quantity <= 0
      current_cart_item.destroy
    else
      @cart.cart_items.create(property: @property, quantity:,size:)
    end


    redirect_to cart_path

  end


  def show
    
    @all_property=Property.all.length
    @prop = Property.find(rands(@all_property,5))


  end

  def update
    
    loopnum=@cart.cart_items.length-1
    for j in 0..loopnum
      @property = Property.find_by(id: params[:id][j])
      quantity = params[:quantity][j].to_i
      size = params[:size][j].to_i
      current_cart_item = @cart.cart_items.find_by(property_id: @property.id,size: size)
      if current_cart_item  && quantity > 0 
        current_cart_item.update(quantity:)
        current_cart_item.update(size:)
      elsif quantity <= 0
        current_cart_item.destroy
      else
        current_cart_item.destroy
        @cart.cart_items.create(property: @property, quantity:,size:)
      end

    end
    redirect_to cart_confirm_path

  end

  def confirm
    if user_signed_in?
      authenticate_user!
    end
  end

  def order_summery

  end

  def go
   
    @cart = Cart.find(params[:id])
      if @cart.update(cart_params)
        redirect_to cart_order_summery_path
        if user_signed_in?
          authenticate_user!
          @user=current_user
          @user.update(user_params)
        end
      else
        render :show, status: :unprocessable_entity
      end

  end

  def remove
    CartItem.find_by(id: params[:id]).destroy
    redirect_to cart_path
  end



  private

    # Only allow a list of trusted parameters through.
    def cart_params
      if user_signed_in?
        params.permit(:id, :name, :post_code,:prefecture,:municipality,:house_number,:phone_number,:user_id,:email)
      else
        params.permit(:id, :name, :post_code,:prefecture,:municipality,:house_number,:phone_number,:email)
      end
    end

    def user_params
      params.permit(:name, :post_code,:prefecture,:municipality,:house_number,:phone_number)
    end

    def rands(n,m)
      result=[]
      memo  ={}
      m = n if n < m
      1.upto(m){|low|
          v = rand(low..n)
          if !memo[v]
              result << v
              memo[v] = memo[low] || low
          else
              result << memo[v]
              memo[v] = memo[low] || low
          end
      }
      return result
    end


    def prevent_url
      if @cart.cart_items.length==0
        redirect_to root_path
      end
    end
    def blank_url
      if @cart.name.blank? or @cart.post_code.blank? or @cart.prefecture.blank? or @cart.municipality.blank? or @cart.house_number.blank? or @cart.phone_number.blank?
        redirect_to root_path
      end
    end
end
