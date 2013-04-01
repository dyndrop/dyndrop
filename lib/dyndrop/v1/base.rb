require "multi_json"
require "tmpdir"

require "dyndrop/baseclient"

require "dyndrop/errors"

module Dyndrop::V1
  class Base < Dyndrop::BaseClient

    def get_token(identifier, payload)
      post("1", "users", identifier, "tokens", :content => :json, :accept => :json, :payload => payload)
    end

    # Users
    def create_user(payload)
      # no JSON response
      post("users", :content => :json, :payload => payload)
    end

    # Applications
    def instances(name)
      get("apps", name, "instances", :accept => :json)[:instances]
    end


  end
end
