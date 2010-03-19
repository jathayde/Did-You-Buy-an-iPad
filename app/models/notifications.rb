class Notifications < ActionMailer::Base
  

  def new_purchase(purchase)
    subject    "[didyoubuyanipad] New purchase recorded (#{Purchase.count} so far)"
    recipients %w{tom@infoether.com dougmarch@gmail.com jathayde@infoether.com}
    from       "jathyade@boboroshi.com"
    sent_on    Time.now
    body       :purchase => purchase
  end

end
