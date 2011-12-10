class Token
  START = 46

  def self.get_token(id)
    (id.to_i + START).to_s(36)
  end

  def self.get_id(token)
    token.to_i(36)
  end
end