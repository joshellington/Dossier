class RenameTypeToFrequencyInSubscribers < ActiveRecord::Migration
  def up
    add_column :subscribers, :frequency, :string
    remove_column :subscribers, :type
  end

  def down
    remove_column :subscribers, :frequency
    add_column :subscribers, :type, :string
  end
end
