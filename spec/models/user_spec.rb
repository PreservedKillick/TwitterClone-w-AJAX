require 'spec_helper'

describe User do

  it { should have_many :tweets}
  it { should validate_presence_of :name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :handle }
  it { should validate_presence_of :password }
  it { should have_secure_password }
  it { should validate_uniqueness_of :email}

  it 'should check for duplicates' do
    FactoryGirl.create(:bailey_user)
    should validate_uniqueness_of :handle
  end

  it "won't save if the handle is already taken" do
    user1 = FactoryGirl.create(:bailey_user)
    user2 = FactoryGirl.build(:bad_user)
    user2.save.should eq false
  end

  it 'sends a welcome email' do
    user = User.new(:name => "Bailey", :handle => "BayBay", :email => 'mac@chs.com', :password => 'password', :password_confirmation => 'password')
    expect(UserMailer).to receive(:send_confirmation).with(user)
    user.save
  end

end
