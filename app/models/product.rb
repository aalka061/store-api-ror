class Product < ApplicationRecord
    belongs_to :shop

    def self.find_shop_products_by_id(shop_id)
        Shop.find(shop_id).products
    end
end
