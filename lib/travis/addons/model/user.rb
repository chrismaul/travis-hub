require 'travis/encrypt'

class User < ActiveRecord::Base
  include Travis::Encrypt::Helpers::ActiveRecord

  class << self
    def with_github_token
      where("github_oauth_token IS NOT NULL and github_oauth_token != ''")
    end

    def with_permissions(permissions)
      where(:permissions => permissions).includes(:permissions)
    end
  end

  has_many :permissions
  has_many :repositories, through: :permissions

  attr_encrypted :github_oauth_token
end
