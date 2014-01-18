require 'spec_helper'

describe TweetTip, 'associations' do
  it { expect(subject).to belong_to(:recipient) }
  it { expect(subject).to belong_to(:sender) }
end

describe TweetTip, 'validations' do
  it { expect(subject).to validate_presence_of(:content) }
  it { expect(subject).to validate_presence_of(:screen_name) }
end
