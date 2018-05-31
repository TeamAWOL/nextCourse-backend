RSpec.describe User, type: :model do
  it "should have secure password" do
    user = User.create(first_name: 'Bob',
                       last_name: 'hope',
                       email: 'test@test',
                       zipcode: '93841',
                       dob: '',
                       password: 'secret')
    expect(user.save).to be true
    expect(user.authenticate('not-secret')).to be false
  end

  it "should succeed on good password confirmation" do
    user = User.create(
      email: 'test@test',
      password: 'secret',
      password_confirmation: 'secret'
    )
    expect(user.save).to be true
  end
end
