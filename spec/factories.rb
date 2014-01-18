FactoryGirl.define do
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
  end

  factory :user do

  end
end
