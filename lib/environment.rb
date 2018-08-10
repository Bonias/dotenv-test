class Environment
  def self.load
    Dotenv.load Rails.root.join('.env.local')
    Dotenv.load! Rails.root.join(".env.#{current}")
  end

  def self.current
    @current ||=
      begin
        real_env = Rails.env
        country = ENV['COUNTRY'].to_s.downcase

        real_env.production? ? "#{real_env}_#{country}" : real_env
      end
  end
end
