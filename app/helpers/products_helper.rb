module ProductsHelper
  include ConsoleColors
  def log(var, string)
    debug(var, string)
  end
end
# def debug(var, description, color = :white, bg_color = :yellow, width = 80)
#   num_hashes = (width - description.length - 2) / 2
#   if description.length % 2 == 0
#     extra_hash = 0
#   else
#     extra_hash = 1
#   end
#   puts "#{CLR[:txt][color]}#{CLR[:bld]}#{CLR[:bg][bg_color]}#{"-" * width}#{CLR[:stop]}"
#   puts "#{CLR[:txt][color]}#{CLR[:bld]}#{CLR[:bg][bg_color]}#{'#' * num_hashes} #{description} #{'#' * (num_hashes + extra_hash)}#{CLR[:stop]}"
#   puts "#{CLR[:txt][color]}#{CLR[:bld]}#{CLR[:bg][bg_color]}#{"-" * width}#{CLR[:stop]}"
#
#   # =======================
#   # Wraps text to set width
#   # -----------------------
#   wrapped_inspect = var.inspect.scan(/.{1,#{width}}/)
#   wrapped_inspect.each do |line|
#     bg_clr = :blue
#     puts "#{CLR[:txt][:white]}#{CLR[:bld]}#{CLR[:bg][bg_clr]}#{line}#{CLR[:stop]}"
#   end
#   print_colored_line(width: width, color: :white, bg_color: :yellow)
# end