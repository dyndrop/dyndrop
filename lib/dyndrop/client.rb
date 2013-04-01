require "dyndrop/baseclient"
require "dyndrop/rest_client"
require "dyndrop/auth_token"

require "dyndrop/v1/base"
require "dyndrop/v1/client"

module Dyndrop
  class Client < BaseClient
    def self.new(*args)
      target, _ = args

      base = super(target)

      Dyndrop::V1::Client.new(*args)
    end
  end
end
