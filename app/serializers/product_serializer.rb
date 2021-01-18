class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :image_url, :created_at, :category
end
