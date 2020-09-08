class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user
  validates_presence_of :body, :conversation_id, :user_id

  def message_time
    weeks = %w[月 火 水 木 金 土 日]
    index = created_at.strftime('%u').to_i
    created_at.strftime("%Y年%-m月%-d日 #{weeks[index - 1]}曜日 %-H時%-M分")
  end
end
