require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  
  %w{street number city state zip}.each do |col|
    test "#{col} should be required" do
      address = Address.create
      assert address.errors.on(col), "Deveria validar #{col}"
    end
  end
  
  test "should validate format of zip" do
    address = Address.create :zip => "dslvbal"
    assert address.errors.on(:zip), "Deveria validar o formato do zip"
    address = Address.create :zip => "90230-123"
    assert ! address.errors.on(:zip), "Não tem erro em zip"
  end
  
  test "should have complete address location " do
    address = Address.create :street => 'street', :number => '123', :city => 'city', :state => 'state', :zip => '12345-123'
    assert_equal 'street, 123 - city/state - 12345-123', address.complete
  end
  
end
