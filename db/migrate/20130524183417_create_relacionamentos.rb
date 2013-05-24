class CreateRelacionamentos < ActiveRecord::Migration
  def change
    create_table :relacionamentos do |t|
      t.references :desta, index: true
      t.references :para_esta, index: true
      t.string :tipo

      t.timestamps
    end
  end
end
