class ChangeColumnLongitudeAndLattitudeForPosts < ActiveRecord::Migration[5.2]
  def change
    if table_exists? :posts
      if column_exists? :posts, :longitude
        change_column_null :posts, :longitude, false
      end

      if column_exists? :posts, :lattitude
        change_column_null :posts, :lattitude, false
      end
    end
  end
end
