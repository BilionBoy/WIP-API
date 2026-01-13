# frozen_string_literal: true

class Produto < ApplicationRecord
  
  validates :nome, :preco, :ativo, presence: true
  
end
