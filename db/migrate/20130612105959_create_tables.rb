class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_hash
      t.timestamps
    end

    create_table :posts do |t|
      t.string :title
      t.text :url
      t.text :body
      t.integer     :score, :default => 0
      t.references :user
      t.timestamps
    end
    
    create_table :comments do |t|
      t.string      :body
      t.integer     :score, :default => 0
      t.references  :post
      t.references  :user
      t.timestamps
    end
    
    create_table :post_votes do |t|
      t.references  :user
      t.references  :post
      t.timestamps
    end

    create_table :comment_votes do |t|
      t.references  :user
      t.references  :comment
      t.timestamps
    end

  end
end
