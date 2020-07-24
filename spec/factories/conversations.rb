FactoryBot.define do
  factory :conversation do
    sender_id { '1' }
    recipient_id { '2' }
  end
  # factory :second_conversation, class: Conversation do
  #   sender_id { '2' }
  #   recipient_id { '1' }
  # end
end
