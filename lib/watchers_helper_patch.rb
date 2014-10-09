require 'watchers_helper'
require 'application_helper_patch'

module UserIndicator
  module Patches
    module WatchersHelperPatch
      def self.included(base) # :nodoc:
        # sending instance methods to module
        base.send(:include, InstanceMethods)

        base.class_eval do
          unloadable

          # aliasing methods if needed
          alias_method_chain :watchers_checkboxes, :feature
        end
      end

      module InstanceMethods
        def watchers_checkboxes_with_feature(object, users, checked = nil)
          users.map do |user|
            c = checked.nil? ? object.watched_by?(user) : checked
            tag = check_box_tag 'issue[watcher_user_ids][]', user.id, c, :id => nil
            content_tag 'label', "#{tag} #{h(user)} #{user_indicator user}".html_safe,
                        :id => "issue_watcher_user_ids_#{user.id}",
                        :class => "floating"
          end.join.html_safe
        end
      end
    end
  end
end

# now we should include this module in ApplicationHelper module
unless WatchersHelper.included_modules.include? UserIndicator::Patches::WatchersHelperPatch
    WatchersHelper.send(:include, UserIndicator::Patches::WatchersHelperPatch)
end
