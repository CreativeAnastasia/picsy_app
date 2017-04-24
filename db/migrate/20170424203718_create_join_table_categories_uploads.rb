class CreateJoinTableCategoriesUploads < ActiveRecord::Migration[5.0]
  def change
    create_join_table :categories, :uploads do |t|
      # t.index [:category_id, :upload_id]
      # t.index [:upload_id, :category_id]
    end
  end
end
