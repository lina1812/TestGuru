class AddQuestionsCountToTest < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :questions_count, :integer
  end
end
