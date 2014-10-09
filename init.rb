require 'redmine'
require 'application_helper_patch'
require 'watchers_helper_patch'
require 'application_controller_patch'
require 'user_indicator_js_and_css'

Redmine::Plugin.register :redmine_user_indicator do
  name 'Redmine User Indicator'
  author 'Alexander Krasnoyarov (sheo13666)'
  description 'User indicator online/offline'
  version '0.0.1'
  url 'https://github.com/olemskoi/redmine_sms_auth'
  author_url 'https://github.com/sheo13666'
  requires_redmine :version_or_higher => '2.5.2'

  settings :default => {'user_indicator_idle_time' => (60 * 15)}, :partial => 'settings/general_settings'
end
