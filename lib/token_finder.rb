module TokenFinder
  extend ActiveSupport::Concern

  module ClassMethods
    def find(*args)
      first_arg = args.first
      if (args.size == 1)
        first(:conditions => "token = '#{first_arg}' OR id = '#{first_arg}'")
      else
        super *args
      end
    end
  end
end