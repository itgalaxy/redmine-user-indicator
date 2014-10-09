# This class hooks into Redmine's View Listeners in order to
# add content to the page
class Hooks  < Redmine::Hook::ViewListener

  ASSETS = File.dirname(__FILE__) + '/../assets'

  # Custom styles
  def view_layouts_base_html_head(context = {})
    if File.file?( "#{ASSETS}/stylesheets/user-indicator.css" )
      stylesheet_link_tag "user-indicator", :plugin => 'redmine_user_indicator'
    end
  end

  # Todo: write javascript (short polling or socket.io)
  # Call javascript if found corresponding file for every project
  # def view_layouts_base_body_bottom(context = {})
  #  if File.file?( "#{ASSETS}/javascripts/user-indicator.js")
  #    javascript_include_tag "user-indicator", :plugin => 'redmine_user_indicator'
  #  end
  # end

end
