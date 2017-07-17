class AddJsonweatherToWeathers < ActiveRecord::Migration[5.1]
  def change
    add_column :weathers, :jsonweather, :string
  end
end
