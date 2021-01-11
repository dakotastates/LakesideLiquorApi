class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :author, :source, :image_url, :instructions, :created_at, :updated_at
end
