class RemovePostIdFromCommentsAddParentPolymorphic < ActiveRecord::Migration
  def change
    remove_reference :comments, :parent, index: true, foreign_key: true
    remove_reference :comments, :post, index: true, foreign_key: true
  end
end
