class CreateReceivedBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :received_badges do |t|
      t.references :user, null: false, foreign_key: true
      t.references :badge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
