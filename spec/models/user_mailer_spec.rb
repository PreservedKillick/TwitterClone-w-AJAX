require 'spec_helper'

describe UserMailer do
 it "sends an email" do
    @user = FactoryGirl.create(:bailey_user)
    UserMailer.send_confirmation(@user)
    ActionMailer::Base.deliveries.last.to.should == [@user.email]
  end

  describe 'send_confirmation' do
    let(:user) { FactoryGirl.create(:bailey_user) }
    let(:mail) { UserMailer.send_confirmation(user) }

    it 'renders the subject' do
      mail.subject.should == 'Signup Confirmation'
    end

    it 'renders the receiver email' do
      mail.to.should == [user.email]
    end

    it 'renders the sender email' do
      mail.from.should == ['bailey@chs.com']
    end

    it 'assigns @name' do
      mail.body.encoded.should match(user.name)
    end

    it 'assigns @confirmation_url' do
      mail.body.encoded.should match("localhost:3000/users/#{user.id}")
    end
  end
end
