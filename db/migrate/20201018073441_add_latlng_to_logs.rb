class AddLatlngToLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :logs, :latlng, :string
  end
end
