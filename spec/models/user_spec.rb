require 'spec_helper'

describe User do

  it { should validate_presence_of :name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :handle }
  it { should validate_presence_of :password }
  it { should have_secure_password }
  it { should validate_uniqueness_of :email}
  it { should validate_uniqueness_of :handle}

  it 'sends a welcome email' do
    user = User.new(:name => "Bailey", :handle => "BaiBai", :email => 'mac@chs.com', :password => 'password', :password_confirmation => 'password')
    expect(UserMailer).to receive(:send_confirmation).with(user)
    user.save
  end

end
