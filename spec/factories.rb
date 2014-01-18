FactoryGirl.define do
  sequence :screen_name do |n|
    "bitcoinmafia#{n}"
  end

  factory :address do
    encrypted_private_key SecureRandom.hex(64)
    public_key SecureRandom.hex(64)
    address SecureRandom.hex(64)
    user
  end

  factory :transaction do
    satoshis 100
    tx_hash SecureRandom.hex(64)
    tweet_tip
  end

  factory :tweet_tip do
    satoshis 100
    tx_hash SecureRandom.hex(64)
    content '@sidazhang 1 BTC'
    screen_name 'bitcoinmafia'
    api_tweet_id_str '123'
    recipient { create(:user) }
    sender { create(:user) }
  end

  factory :user do
    screen_name
  end
end
