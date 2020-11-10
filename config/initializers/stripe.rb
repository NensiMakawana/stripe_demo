Rails.configuration.stripe = {
  publishable_key: 'add_publc_key_here',
  secret_key: 'add_secret_key_here'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]