module ApplicationHelper
  include ConsoleColors
  def log(var, string)
    debug(var, string)
  end
end
