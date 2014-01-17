FactoryGirl.define do
  factory :transaction do
    satoshis 100
    tx_hash SecureRandom.hex(64)
    tweet_tip
  end

  factory :tweet_tip do
    content '@sidazhang 1 BTC'
    screen_name '@bitcoinmafia'
  end
end
