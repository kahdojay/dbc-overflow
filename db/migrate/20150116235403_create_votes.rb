class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user, null: false
      t.references :votable, polymorphic: true, index: true, null: false
      t.boolean :upvote, null: false
    end
  end
end
