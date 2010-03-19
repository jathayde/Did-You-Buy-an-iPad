require 'test_helper'

class NotificationsTest < ActionMailer::TestCase
  test "new_purchase" do
    @expected.subject = 'Notifications#new_purchase'
    @expected.body    = read_fixture('new_purchase')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Notifications.create_new_purchase(@expected.date).encoded
  end

end
