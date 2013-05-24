class CreateCampos < ActiveRecord::Migration
  def change
    create_table :campos do |t|
      t.references :entidade, index: true
      t.string :nome
      t.string :tipo

      t.timestamps
    end
  end
end
