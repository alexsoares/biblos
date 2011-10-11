class LivrosController < ApplicationController
  before_filter :load_areas
  before_filter :load_unidades
  before_filter :load_identificacaos

  # GET /livros
  # GET /livros.xml
  def index
    @livros = Livro.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @livros }
    end
  end

  # GET /livros/1
  # GET /livros/1.xml
  def show
    @livro = Livro.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @livro }
    end
  end

  # GET /livros/new
  # GET /livros/new.xml
  def new
    @livro = Livro.new
    1.times do
      localizacao = @livro.localizacaos.build
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @livro }
    end
  end

  # GET /livros/1/edit
  def edit
    @livro = Livro.find(params[:id])
  end

 def identificador
    session[:numero] = params[:livro_identificacao_id].to_i
    @identificacao = Identificacao.find(session[:numero])
    render :partial => "identificador"
  end

  # POST /livros
  # POST /livros.xml
  def create
    @livro = Livro.new(params[:livro])
 
    respond_to do |format|
      if @livro.save
        flash[:notice] = 'Livro was successfully created.'
        format.html { redirect_to(@livro) }
        format.xml  { render :xml => @livro, :status => :created, :location => @livro }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @livro.errors, :status => :unprocessable_entity }
      end
    end
  end
  # PUT /livros/1
  # PUT /livros/1.xml
  def update
    @livro = Livro.find(params[:id])

    respond_to do |format|
      if @livro.update_attributes(params[:livro])
        flash[:notice] = 'Livro was successfully updated.'
        format.html { redirect_to(@livro) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @livro.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /livros/1
  # DELETE /livros/1.xml
  def destroy
    @livro = Livro.find(params[:id])
    @livro.destroy

    respond_to do |format|
      format.html { redirect_to(livros_url) }
      format.xml  { head :ok }
    end
  end

  def regras
    render :partial => 'regras'
  end


protected

  def load_areas
      @areas = Area.find(:all, :order => 'area ASC')
  end

    def load_unidades
      @unidades = Unidade.find(:all, :order => 'nome ASC')
  end

  def load_identificacaos
      @identificacaos = Identificacao.find(:all, :order=> 'titulo ASC')
end

end
