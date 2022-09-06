

class WebhooksController < ApplicationController
    require 'json'
    require 'sinatra'
    require 'stripe'
    
    # This is your Stripe CLI webhook secret for testing your endpoint locally.
    endpoint_secret = 'whsec_c8c3d5106b574c7f74241e00d2426e9258b84658a4e93a808b98e25dbe581c07'
    
    set :port, 3000
    
    post '/webhook' do
        payload = request.body.read
        sig_header = request.env['HTTP_STRIPE_SIGNATURE']
        event = nil
    
        begin
            event = Stripe::Webhook.construct_event(
                payload, sig_header, endpoint_secret
            )
        rescue JSON::ParserError => e
            # Invalid payload
            status 400
            return
        rescue Stripe::SignatureVerificationError => e
            # Invalid signature
            status 400
            return
        end
    
        # Handle the event
        case event.type
        when 'payment_intent.succeeded'
            payment_intent = event.data.object
        # ... handle other event types
        else
            puts "Unhandled event type: #{event.type}"
        end
    
        status 200
    end
end