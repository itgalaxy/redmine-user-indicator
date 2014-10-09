require 'application_controller'

module UserIndicator
  module Patches
    module ApplicationControllerPatch
      def self.included(base) # :nodoc:
        # sending instance methods to module
        base.send(:include, InstanceMethods)

        base.class_eval do
          unloadable

          # aliasing methods if needed
          alias_method_chain :user_setup, :feature
        end
      end

      module InstanceMethods
        def user_setup_with_feature
          puts "Handle action"
          Setting.check_cache
          # Find the current user
          User.current = find_current_user
          # Update last action for current user
          User.current.last_action = Time.now
          User.current.save
          logger.info("  Current user: " + (User.current.logged? ? "#{User.current.login} (id=#{User.current.id})" : "anonymous")) if logger
        end
      end
    end
  end
end

# now we should include this module in ApplicationHelper module
unless ApplicationController.included_modules.include? UserIndicator::Patches::ApplicationControllerPatch
    ApplicationController.send(:include, UserIndicator::Patches::ApplicationControllerPatch)
end
