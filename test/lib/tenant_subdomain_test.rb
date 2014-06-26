require 'test_helper'

class TenantSubdomainTest < ActiveSupport::TestCase

  test "tenant domains should not matches reserved domains" do
    request = mock('request')
    request.stubs(:subdomain).returns('sysadmin')
    assert_not TenantSubdomain.matches?(request)
  end

  test "tenant domains should not matches if subdomain blank" do
    request = mock('request')
    request.stubs(:subdomain).returns(nil)
    assert_not TenantSubdomain.matches?(request)
  end

  test "tenant domains should matches my-tenant-domain" do
    request = mock('request')
    request.stubs(:subdomain).returns('my-tenant-domain')
    assert TenantSubdomain.matches?(request)
  end

end
