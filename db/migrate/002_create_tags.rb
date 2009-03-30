class CreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
      t.column :tag_id, :integer, :null => false
      t.column :tag_name, :text, :null => false
    end

    #execute "alter table entries add constraint fk_entry_tags foreign key (tag_id) references users(id)"

  end

  def self.down
    drop_table :tags
  end
end
