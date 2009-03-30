class CreatePermissions < ActiveRecord::Migration
  def self.up
    create_table :permissions do |t|
      t.column :permission_id, :integer, :null => false
      t.column :permission_name, :string, :null => false
    end

    Permission.create(:id => 1, :permission_id => 1, :permission_name => 'abc')
    Permission.create(:id => 2, :permission_id => 2, :permission_name => 'abc')
  end

  def self.down
    drop_table :permissions
  end
end
