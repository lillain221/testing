class LikeController < ApplicationController
    before_action :authenticate_user!
    def index
        @user = current_user
        favorites= Favorite.where(user_id: @user.id).pluck(:property_id)
        @favorite_posts = Property.find(favorites)
        @all_property=Property.all.length
        @prop = Property.find(rands(@all_property,5))
      end


    private
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
  end
  