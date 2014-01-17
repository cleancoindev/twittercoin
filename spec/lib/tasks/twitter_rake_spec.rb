require 'spec_helper'
require_relative '../../../app/services/api/pager_duty_mgr'

describe 'twitter:listen' do
  include_context 'rake'

  it 'notifies PagerDuty when passed a Twitter Stall Error' do
    TWITTER_STREAM.stub(:user).and_yield(Twitter::Streaming::StallWarning)
    API::PagerDutyMgr::CriticalBug.stub(:trigger)

    rake

    sleep 0.1
    expect(API::PagerDutyMgr::CriticalBug).to have_received(:trigger).with(
      'Falling behind!'
    )
  end
end
