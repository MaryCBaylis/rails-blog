class CreateSchema < ActiveRecord::Migration
  def change
    create_table :entries do |t|
    	t.string :title
    	t.string :content

    	t.timestamps
    end

    create_table :users do |t|
        t.string :name
    	t.string :email
    	t.string :password_digest

    	t.timestamps
    end
  end
end
