require 'test_helper'

class PatientTest < ActiveSupport::TestCase
  def setup
    @patient = Patient.new(name: "shivangi", email: "shivangi@gmail.com", password: "1234", age: "21", address: "Indore")
  end
  test "should be valid" do
    assert @patient.valid?
  end

  test "name should be present" do
    @patient.name = ""
    assert_not @patient.valid?
  end

  test "email should be present" do
    @patient.email = "     "
    assert_not @patient.valid?
  end

    test "name should not be too long" do
    @patient.name = "a" * 51
    assert_not @patient.valid?
  end

  test "email should not be too long" do
    @patient.email = "a" * 244 + "@example.com"
    assert_not @patient.valid?
  end
  test "email validation should accept valid addresses" do
    valid_addresses = %w[shivangi@gmail.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @patient.email = valid_address
      assert_not @patient.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @patient.email = invalid_address
      assert_not @patient.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_patient = @patient.dup
    duplicate_patient.email = @patient.email.upcase
    @patient.save
    assert_not duplicate_patient.valid?
  end
end
