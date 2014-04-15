require 'spec_helper'

describe UserMailer do
 it "sends an email" do
    @user = FactoryGirl.build(:bailey_user)
    UserMailer.send_confirmation(@user)
    # @user.send_welcome_message
    ActionMailer::Base.deliveries.last.to.should == [@user.email]
  end
end
