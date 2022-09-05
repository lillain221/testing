class CheckoutController < ApplicationController
    def create
        if user_signed_in?
            authenticate_user!
            customer=current_user.stripe_id
            @cart.update(stripe_id:customer)
        else
            customer=Stripe::Customer.create(email: @cart.email)
            @cart.update(stripe_id:customer.id)
        end
        @session = Stripe::Checkout::Session.create({
            customer: customer,
            payment_method_types: ['card','konbini'],
            line_items: @cart.cart_items.collect { |item| item.to_builder.attributes! },
            mode: 'payment',
            success_url: root_url,
            cancel_url: cart_order_summery_url,
          })
    end
end
  