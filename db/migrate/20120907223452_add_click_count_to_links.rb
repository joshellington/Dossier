class AddClickCountToLinks < ActiveRecord::Migration
  def change
    add_column :links, :click_count, :integer
  end
end
