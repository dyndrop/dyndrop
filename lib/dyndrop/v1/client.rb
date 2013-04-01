module Dyndrop::V1
  # The primary API entrypoint. Wraps a BaseClient to provide nicer return
  # values. Initialize with the target and, optionally, an auth token. These
  # are the only two internal states.
  class Client

    attr_reader :base

    # Create a new Client for interfacing with the given target.
    #
    # A token may also be provided to skip the login step.
    def initialize(target = "http://api.dyndrop.com", token = nil)
      @base = Base.new(target, token)
    end

    def version
      1
    end

    # The current target URL of the client.
    def target
      @base.target
    end

    # Current authentication token.
    def token
      @base.token
    end

    # Set the authentication token.
    def token=(token)
      @base.token = token
    end

    # Current proxy user. Usually nil.
    def proxy
      @base.proxy
    end

    # Set the proxy user for the client. Must be authorized as an
    # administrator for this to have any effect.
    def proxy=(email)
      @base.proxy = email
    end

    # Is the client tracing API requests?
    def trace
      @base.trace
    end

    # Set the tracing flag; if true, API requests and responses will be
    # printed out.
    def trace=(bool)
      @base.trace = bool
    end

    # The current log. See +log=+.
    def log
      @base.log
    end

    # Set the logging mode. Mode can be one of:
    #
    # [+String+] Name of a file to log the last 10 requests to.
    # [+Array+]  Array to append with log data (a Hash).
    # [+IO+]     An IO object to write to.
    # [+false+]  No logging.
    def log=(mode)
      @base.log = mode
    end

    # The currently authenticated user.
    def current_user
      if user = info[:user]
        user(user)
      end
    end

    def current_space
      nil
    end

    def current_org
      nil
    end


    # Retrieve target metadata.
    def info
      @base.info
    end

    # Identifier can be a username or an email
    def login(identifier, password)
      @base.token = Dyndrop::AuthToken.from_token_info(@base.get_token(identifier, {:password => password}))
    end


    # Create a user on the target and return a User object representing them.
    def register(email, password)
      @base.create_user(:email => email, :password => password)
      user(email)
    end

    # Clear client token. No requests are made for this.
    def logout
      @base.token = nil
    end

    # Is an authentication token set on the client?
    def logged_in?
      !!@base.token
    end
  end
end
