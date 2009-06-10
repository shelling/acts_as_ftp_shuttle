class CreatePDFModels < ActiveRecord::Migration

  def self.up
    create_table :pdf_models do |t|
      t.string :filename
      t.timestamps
    end
  end

  def self.down
    drop_table :pdf_models
  end

end
