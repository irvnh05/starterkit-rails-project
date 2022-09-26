class AddReviewByToRecapSales < ActiveRecord::Migration[5.2]
  def change
    add_column :recap_sales, :review_by, :string
  end
end
