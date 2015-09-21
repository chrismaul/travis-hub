module Travis
  module Hub
    module Helper
      module Locking
        def exclusive(key, options = nil, &block)
          options ||= Hub.config.lock
          Travis::Support::Lock.exclusive(key, options, &block)
        end
      end
    end
  end
end