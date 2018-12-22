class CreateEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :episodes do |t|
      t.string :title
      t.boolean :is_completed, default: false

      t.timestamps
    end
  end
end
