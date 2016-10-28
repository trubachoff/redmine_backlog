require 'redmine'

# This is the important line.
# It requires the file in lib/backlog/hooks/controller_agile_boards_hook.rb
require_dependency 'backlog/hooks/controller_backlog_hook'

Redmine::Plugin.register :redmine_backlog do
  name 'Redmine Backlog plugin'
  author 'trubachoff'
  description 'This is a plugin for Redmine'
  version '0.0.12'
  author_url 'mailto:trubachoff@gmail.com'
  requires_redmine_plugin :redmine_agile, :version_or_higher => '1.4.0'

  cf_id = 'cf_' + CustomField.find_by(name: 'In Sprint').id.to_s
  menu :top_menu, :backlog, { :controller => 'backlogs', :action => 'index', :project_id => nil, :set_filter => 1, :f => [cf_id], :op => {cf_id => '!'}, :v => {cf_id => [1]} }, :caption => :label_backlog

  settings :default => {'empty' => true}, :partial => 'backlog_settings'

  project_module :backlog do
    permission :view_backlog, :backlogs => :index
    permission :update_backlog, :backlogs => :update_row_order, :public => true
  end

end
