class AddParentToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :parent, polymorphic: true, index: true
  end
end
