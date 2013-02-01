# This migration comes from devise_social_engine (originally 20130101214137)
class CreateSocialAuthentications < ActiveRecord::Migration
  def change
    create_table :social_authentications do |t|
      t.string :type
      t.belongs_to :authenticatable, polymorphic: true
      t.string :provider
      t.string :uid
      t.string :token
      t.datetime :expires_at

      t.timestamps
    end
    add_index :social_authentications, :type
    add_index :social_authentications, [:authenticatable_type, :authenticatable_id], name: 'index_social_authentications_on_authenticatable'
    add_index :social_authentications, [:provider, :uid]
  end
end
