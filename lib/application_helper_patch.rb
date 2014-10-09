require 'application_helper'

module UserIndicator
  module Patches
    module ApplicationHelperPatch
      def self.included(base) # :nodoc:
        # sending instance methods to module
        base.send(:include, InstanceMethods)

        base.class_eval do
          unloadable

          # aliasing methods if needed
          alias_method_chain :link_to_user, :feature
          alias_method_chain :principals_options_for_select, :feature
        end
      end

      module InstanceMethods
        def link_to_user_with_feature(user, options={})
          if user.is_a?(User)
            name = h(user.name(options[:format]))
            if user.active? || (User.current.admin? && user.logged?)
              (link_to name, user_path(user), :class => user.css_classes) << (user_indicator user)
            else
              name
            end
          else
            h(user.to_s)
          end
        end

        def principals_options_for_select_with_feature(collection, selected = nil)
          s = ''
          if collection.include?(User.current)
            s << content_tag('option', "<< #{l(:label_me)} >>", :value => User.current.id)
          end
          groups = ''
          collection.sort.each do |element|
            selected_attribute = ' selected="selected"' if option_value_selected?(element, selected)
            (element.is_a?(Group) ? groups : s) << %(<option value="#{element.id}"#{selected_attribute}>#{h element.name}(#{user_indicator_text_status element})</option>)
          end
          unless groups.empty?
            s << %(<optgroup label="#{h(l(:label_group_plural))}">#{groups}</optgroup>)
          end
          s.html_safe
        end

        def user_indicator(user)
          online = is_user_online user
          return ("<sup data-ui-component=\"user-indicator\" data-user-indicator-user-id=\"" + user.id.to_s  + "\" class=\"user-indicator user-indicator-" + (online ? "online" : "offline") + "\">" + (online ? "online" : "offline") + "</sup>").html_safe
        end

        def user_indicator_text_status(user)
          online = is_user_online user
          return (online ? "online" : "offline")
        end

        def is_user_online(user)
          return !user.last_action.nil? && user.last_action + Setting["plugin_redmine_user_indicator"]["user_indicator_idle_time"].to_i >= Time.now ? true : false
        end
      end
    end
  end
end

# now we should include this module in ApplicationHelper module
unless ApplicationHelper.included_modules.include? UserIndicator::Patches::ApplicationHelperPatch
    ApplicationHelper.send(:include, UserIndicator::Patches::ApplicationHelperPatch)
end
