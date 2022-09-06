# frozen_string_literal: true

class PropertiesController < ApplicationController

  def show
    @property = Property.find(params[:id])
    @all_property=Property.all.length
    @prop = Property.find(rands(@all_property,5))
  end
  
  def create
    property = Product.new(property_params)
    property.save
  end
  def new
    @property = Property.new
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
