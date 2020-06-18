class JsonWebToken
  # Wrapper library for encoding and decoding JWTs.
  SECRET_KEY_BASE = "Test"
  class << self
    def encode(payload, exp = 48.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, SECRET_KEY_BASE)
    end

    def decode(token)
      HashWithIndifferentAccess.new(JWT.decode(token, SECRET_KEY_BASE).first)
    rescue
      nil
    end
  end
end