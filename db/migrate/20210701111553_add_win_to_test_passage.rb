class AddWinToTestPassage < ActiveRecord::Migration[6.0]
  def change
    add_column :test_passages, :win, :boolean, default: false
  end
end
