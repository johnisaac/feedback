class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :content, :null => false

      t.timestamps
    end
  end
end
