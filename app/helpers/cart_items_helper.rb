module CartItemsHelper
  def state_options(country_code)
    Carmen::Country.named(country_code).subregions.map { |subregion| [subregion.name, subregion.code] }
  end
end


