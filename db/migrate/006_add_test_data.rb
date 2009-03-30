class AddTestData < ActiveRecord::Migration
  def self.up
    User.delete_all
    User.create(:name => 'guest',
      :permission_id => '1',
      :profile => 'abcdefg'
    )

    #Entry.delete_all
    #Entry.create(:title => 'Test data',
    #  :body =>
    #  %{This is test date. This is test date. This is test date.},
    #  :user_id => '1'
    #)

    Permission.create(:permission_id => '1',
      :permission_name => '管理者'
    )
    Permission.create(:permission_id => '2',
      :permission_name => '一般ユーザ'
    )
  end

  def self.down
    Entry.delete_all
    User.delete_all
  end
end
