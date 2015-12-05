class AddAmountRaisedToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :amount_raised, :integer, default: 0
  end
end
