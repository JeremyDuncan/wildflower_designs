class AddDetailsToPages < ActiveRecord::Migration[7.0]
  def change
    add_column :pages, :alignment, :string
    add_column :pages, :font_size, :string
    add_column :pages, :text_color, :string
    add_column :pages, :hidden, :boolean
  end
end
