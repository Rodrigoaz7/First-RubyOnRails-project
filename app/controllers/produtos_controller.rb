class ProdutosController < ApplicationController

	before_action :set_produto, only: [:update, :update_banda]
	#Metodo do html index
	def index
		@casas = Casa.all
		@bandas_categoria = Banda.order(:casa).limit 5
		@bandas_nome = Banda.order(:nome).limit 5
		@bandas_preco = Banda.order(:preco).limit 2
	end

	def new_banda
		@all_casas = Casa.all
		@banda = Banda.new
	end

	def create
		#Pegando todos os dados e uma vez e os salvando. Lembar de por o nome da classe no name do form
		#valores = params.require(:banda).permit! #permite qualquer coisa passado pelo user (permit!)
		valores = banda_params
		#Banda.create valores
		#Usando save para poder retornar true ou false em validacoes de campo!
		@banda = Banda.new valores
		if @banda.save
			#Gambiarra pra uma variavel durar mais de uma requisicao
			flash[:notice] = "Criado com sucesso!"
			redirect_to root_url
		else
			@all_casas = Casa.all
			render :new_banda
		end
		# ou
		# nome = params["nome"]
		# facebook = params["facebook"]
		# instagram = params["instagram"]
		# preco = params["preco"]
		#banda = Banda.new
	end

	def delete
		id = params[:id]
		Banda.destroy id
		redirect_to root_url
	end

	def bandas_busca
		@nome_busca = params[:nome]
		#Banda.where nome: "blablabla"  #Maneira de busca ==
		#Banda.where "nome like ? and preco > 100000", nome, preco
		@bandas = Banda.where "nome like ?", "%#{@nome_busca}%" #Maneira de busca inteligente e segura de SQL injection
		#redirect_to bandas_busca_path
	end

	def update
		@all_casas = Casa.all
		render :update
	end

	def update_banda
		valores = banda_params
		if @banda.update valores
			flash[:notice] = "Atualizado com sucesso!"
			redirect_to root_url
		else
			@all_casas = Casa.all
			render :update
		end
	end

	#Metodos privados sao metodos auxiliares!
	private

	def set_produto
		id = params[:id]
		@banda = Banda.find(id)
	end

	def banda_params
		params.require(:banda).permit :nome, :facebook, :instagram, :preco, :casa_id
	end

end
