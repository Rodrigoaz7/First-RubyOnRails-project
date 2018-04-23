class Banda < ApplicationRecord

	belongs_to :casa #Chave estrangeiras

	validates :preco, presence: true #Deixar campo preco obrigatorio
	validates :nome, presence: true #Deixar campo preco obrigatorio
	validates :nome, length: {minimum: 2, maximum: 50}
end
