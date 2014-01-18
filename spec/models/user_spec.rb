require 'spec_helper'

describe User, 'associations' do
  it { expect(subject).to have_many(:tips_received) }
  it { expect(subject).to have_many(:tips_given) }
  it { expect(subject).to have_many(:addresses) }
end

describe User, 'validations' do
  it { expect(subject).to validate_presence_of(:screen_name) }
  it { expect(subject).to validate_uniqueness_of(:screen_name) }
end
