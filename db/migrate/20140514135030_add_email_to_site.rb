class AddEmailToSite < ActiveRecord::Migration
  def change
    add_column :sites, :email, :text
  end
end
