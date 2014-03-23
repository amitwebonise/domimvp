class SmsDispatcher
  def initialize
    @client = Twilio::REST::Client.new('AC94434b3249bf1e053244f312b34c941d', 'dfe805552f9d9cc5d90cb57f60001816')
  end

  def dispatch(phone_number, text)
    @client.account.messages.create(
      :from => "+12198528482",
      :to => phone_number,
      :body => text
    )
  end
end

