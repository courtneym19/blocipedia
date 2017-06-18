class ChargesController < ApplicationController
  def new

  end

  def create
    # Amount in cents
    @amount = 1000

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Blocipedia premium charge',
      :currency    => 'usd'
    )

    current_user.premium!

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  def downgrade
    current_user.standard!
    flash[:success] = "Come back anytime."
    redirect_to root_path
  end
end
