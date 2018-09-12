module Api
    module V1
        class ShopsController < ApplicationController
            def index
                @shops = Shop.order('created_at DESC')
                render json: {status: 'Success', message:'Loadded shops', data: @shops},status: :ok
            end

            def show
                shop = Shop.find(params[:id])
                render json: {status: 'Success', message:'Loadded shop', data: shop},status: :ok

            end

            def create
                shop = Shop.new(shop_params)

                if shop.save
                    render json: {status: 'Success', message:'Created shop', data: shop},status: :ok
                else 
                    render json: {status: 'Error', message:'shop not created', data: shop.errors},status: :unprocessable_entry

                end
            end

            def update 
                shop = Shop.find(params[:id])
                if shop.update(shop_params)
                    render json: {status: 'Success', message:'Updated shop', data: shop},status: :ok
                else 
                    render json: {status: 'Error', message:'shop not updated', data: shop.errors},status: :unprocessable_entry
                end
            end

            def destroy
                shop = Shop.find(params[:id])
                if shop.destroy
                    render json: {status: 'Success', message:'deleted shop', data: shop},status: :ok
                else 
                    render json: {status: 'Error', message:'shop not deleted', data: shop.errors},status: :unprocessable_entry

                end
            end


            private
                def shop_params
                    params.permit(:name, :address)
                end
            
        end
    end
end