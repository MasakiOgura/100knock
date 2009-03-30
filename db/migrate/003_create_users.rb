class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.column :name, :string, :null => false
      t.column :permission_id, :integer, :null => false
      t.column :profile, :text
      t.column :hashed_password, :string
      t.column :salt, :string

      t.column :created_at, :datetime
      t.column :updated_at, :datetime
    end

    # "alter table permissions add constraint fk_user_permissions
    #  foreign key (permission_id) references permissions(id)"
  end

  def self.down
    drop_table :users
  end
end
