[
  'version',
  'stages'
].each do |file|
  require File.expand_path(File.join(File.dirname(__FILE__), 'capistrano', 'git', file))
end
