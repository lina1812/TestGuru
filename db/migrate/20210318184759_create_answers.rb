class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :body, null: false
      t.boolean :carrect, null: false, default: false
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end