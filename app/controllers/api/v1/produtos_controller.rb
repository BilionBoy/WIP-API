# frozen_string_literal: true

module Api
  module V1
    class ProdutosController < ApplicationController
      before_action :set_produto, only: [:show, :update, :destroy]

      def index
        @produtos = Produto.all
        render json: @produtos
      end

      def show
        render json: @produto
      end

      def create
        @produto = Produto.new(produto_params)
        if @produto.save
          render json: @produto, status: :created
        else
          render json: @produto.errors, status: :unprocessable_entity
        end
      end

      def update
        if @produto.update(produto_params)
          render json: @produto
        else
          render json: @produto.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @produto.destroy
        head :no_content
      end

      private

      def set_produto
        @produto = Produto.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Not found" }, status: :not_found
      end

      def produto_params
        params.require(:produto).permit(nome, preco, ativo)
      end
    end
  end
end
