require 'spec_helper'

describe TweetTip, 'associations' do
  it { expect(subject).to belong_to(:recipient) }
  it { expect(subject).to belong_to(:sender) }
end

describe TweetTip, 'validations' do
  it { expect(subject).to validate_presence_of(:content) }
  it { expect(subject).to validate_presence_of(:screen_name) }
end

describe TweetTip, '#build_link' do
  it 'constructs a twitter link with the screen name and api tweet id' do
    tip = build(:tweet_tip, screen_name: 'bitcoinmafia', api_tweet_id_str: '123')

    expect(tip.build_link).to eq 'https://twitter.com/bitcoinmafia/status/123'
  end
end

describe TweetTip, '.unclaimed' do
  it 'returns all valid and non-refunded tips from less than 21 days ago' do
    unclaimed = create(:tweet_tip, created_at: 22.days.ago)
    invalid = create(:tweet_tip, tx_hash: nil)

    unclaimed_tips = subject.class.unclaimed

    expect(unclaimed_tips).to include unclaimed
    expect(unclaimed_tips).to_not include invalid
  end
end

describe TweetTip, '.not_refunded' do
  it 'returns all non-refunded tips' do
    refunded = create(:tweet_tip, tx_hash_refund: SecureRandom.hex(64))
    non_refunded = create(:tweet_tip, tx_hash_refund: nil)

    non_refunded_tips = subject.class.not_refunded

    expect(non_refunded_tips).to include non_refunded
    expect(non_refunded_tips).to_not include refunded
  end
end

describe TweetTip, '.is_valid' do
  it 'returns all valid tips' do
    valid = create(:tweet_tip)
    invalid_satoshis = create(:tweet_tip, satoshis: nil)
    invalid_tx_hash = create(:tweet_tip, tx_hash: nil)

    valid_tips = subject.class.is_valid

    expect(valid_tips).to include valid
    expect(valid_tips).to_not include invalid_satoshis
    expect(valid_tips).to_not include invalid_tx_hash
  end
end

describe TweetTip, '#is_valid?' do
  let(:hash) { SecureRandom.hex(64) }

  it 'returns true if the tip has a tx hash and satoshis' do
    valid = build(:tweet_tip, tx_hash: hash, satoshis: 1)
    invalid_hash = build(:tweet_tip, tx_hash: nil, satoshis: 1)
    invalid_satoshis = build(:tweet_tip, tx_hash: hash, satoshis: nil)

    expect(valid.is_valid?).to eq true
    expect(invalid_hash.is_valid?).to eq false
    expect(invalid_satoshis.is_valid?).to eq false
  end
end
