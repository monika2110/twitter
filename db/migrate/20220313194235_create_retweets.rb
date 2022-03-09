class CreateRetweets < ActiveRecord::Migration[6.1]
  def change
    create_table :retweets do |t|
      t.text "content"
      t.references :user, null: false, foreign_key: true
      t.references :retweetable, polymorphic: true

      t.timestamps
    end
  end
end
