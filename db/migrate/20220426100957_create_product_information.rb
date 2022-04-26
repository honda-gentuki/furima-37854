class CreateProductInformation < ActiveRecord::Migration[6.0]
  def change
    create_table :product_information do |t|
      
      t.timestamps
    end
  end
end
