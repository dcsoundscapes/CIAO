class PaymentsController < ApplicationController
	before_action :authenticate_user!
	
	def create
		@product = Product.find(params[:product_id])
		token = params[:stripeToken]
	# Create the charge on Stripe's servers - this will charge the user's card

	if user_signed_in?
		 @user = current_user
		else
			redirect_to new_user_registration_path
	end
	begin
		charge = Stripe::Charge.create(
			amount: @product.price * 100, # amount in cents, again
			currency: "usd",
			source: token,
			description: @product.name,
			receipt_email: @user.email,
		)

	 if charge.paid
			Order.create(
			user_id: @user.id,
			product_id: params[:product_id],
			total: @product.price
			)
			flash[:notice] = "Thank you for purchasing #{@product.name}!"
	 end

	rescue Stripe::CardError => e
		# The card has been declined
		body = e.json_body
		err = body[:error]
		flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
	end
	redirect_to product_path(@product)
end
	
end
