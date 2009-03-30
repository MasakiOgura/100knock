class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.column :title, :string, :null => false
      t.column :body, :text, :null => false
      t.column :tag_id, :integer
      t.column :user_id, :integer, :null => false
      t.column :comment_id, :integer
      
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
    end

    execute "alter table entries add constraint fk_entry_users foreign key (user_id) references users(id)"
    execute "alter table entries add constraint fk_entry_tags foreign key (tag_id) references tags(id)"

  end

  def self.down
    drop_table :entries
  end
end
