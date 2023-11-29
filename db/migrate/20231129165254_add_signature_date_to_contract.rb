class AddSignatureDateToContract < ActiveRecord::Migration[7.1]
  def change
    add_column :contracts, :signature_date, :date
  end
end
