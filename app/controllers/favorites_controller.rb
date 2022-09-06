class FavoritesController < ApplicationController
    def favorite_params
        params.permit(:user_id, :property_id)
      end
  end
  