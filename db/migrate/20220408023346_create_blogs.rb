class CreateBlogs < ActiveRecord::Migration
  def self.up
    create_table :blogs do |t|
      t.string :title
      t.string :time
      t.string :content

      t.timestamps null:  false
    end
  end
  def self.down
    drop_table :blogs
  end
end
