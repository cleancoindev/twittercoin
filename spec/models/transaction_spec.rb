require 'spec_helper'

describe Transaction, 'associations' do
  it { expect(subject).to belong_to(:tweet_tip) }
end

describe Transaction, 'validations' do
  it { expect(subject).to validate_presence_of(:satoshis) }
  it { expect(subject).to validate_presence_of(:tx_hash) }
  it { expect(subject).to validate_presence_of(:tweet_tip_id) }
  it { expect(create(:transaction)).to validate_uniqueness_of(:tx_hash) }
end
