module Api
    module V1
        class ProductsController < ApplicationController
            include Response
            include ExceptionHandler
            def index
                if params[:shop_id]
                    @products = Product.find_shop_products_by_id(params[:shop_id])
                else 
                    @products = Product.all
                end
                json_response(@products)
            end

            def show
                if params[:shop_id] && params[:id] 
                    product = Shop.find(params[:shop_id]).products.find(params[:id])
                    if product 
                        json_response(product)
                        #render json: {status:"Success", message: "Show product", data: product}, status: :ok
                    end

                else 
                    render json: {status:"ERROR", message: "Wrong Numbef of arguements"}, status: :bad_request
                end
                
            end

            def create
                
                product = Product.create!(product_params)
                json_response(product, :created)
                #render json: {status:"Success", message: "Loadded products", data: products}, status: :ok
            end

            private
            def product_params
                params.permit(:name, :description, :unit_price, :shop_id)
            end
        end
    end
end
