class LivrosController < ApplicationController
  before_filter :load_areas
  before_filter :load_unidades
  before_filter :load_identificacaos
  before_filter :load_editoras
  before_filter :load_assuntos
  # GET /livros
  # GET /livros.xml


 def assunto
 if (params[:search].nil? || params[:search].empty?)
     render 'consultaA'
 else
     @assuntos = Assunto.find(:all, :conditions => ["assunto like ?", "%" + params[:search].to_s + "%"])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @livros }
    end
 end
end



def titulo
 if (params[:search].nil? || params[:search].empty?)
     render 'consultaL'
 else
    @livros = Livro.find(:all, :joins=> :identificacao, :conditions => ["titulo like ?", "%" + params[:search].to_s + "%"])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @livros }
    end
 end
end

def index
 if (params[:search].nil? || params[:search].empty?)
     @livros = Livro.paginate :page => params[:page], :per_page => 15
      $var = 0
    else
      @livros = Livro.find(:all, :joins=> :identificacao, :conditions => ["titulo like ?", "%" + params[:search].to_s + "%"])
      $var = 1
    end
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
      @livro.localizacaos.build
    end
    1.times do
      @livro.assuntos.build
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


  def cons_area_livro
    render 'cons_area'
  end

  def lista_area
     $area = params[:livro_area_id]
    @livros = Livro.find(:all, :conditions => ['area_id='+ $area])
    render :partial => 'lista_consultas'
  end

    def cons_titulo_livro
    render 'cons_titulo'
  end

def lista_titulo
    session[:titulo] = params[:livro_identificacao_id]
    @livros = Livro.find(:all, :conditions => ["identificacao_id =? " , session[:titulo]])
    render :partial => 'lista_consultas'
  end

 def cons_unidade_livro
    render 'cons_unidade'
  end

def lista_unidade
      session[:unidade] = params[:livro_unidade_id]
      @localizacaos = Localizacao.find(:all,  :conditions =>['unidade_id= ?', session[:unidade]])
      render :partial => 'lista_consultas_unidade'
   end

def lista_unidade_area_livro
    session[:area] = params[:livro_area_id]
     @localizacaos = Localizacao.all(:joins => :livro, :conditions => ["livros.area_id=? and unidade_id= ?", +session[:area].to_i, + session[:unidade].to_i] )
    render :partial => 'lista_consultas_unidade'
end

def lista_unidade_titulo_livro
    session[:identificacao] = params[:livro_identificacao_id]
     @localizacaos = Localizacao.all(:joins => :livro, :conditions => ["livros.identificacao_id=? and unidade_id= ?", +session[:identificacao].to_i, + session[:unidade].to_i] )
    render :partial => 'lista_consultas_unidade'
end

def lista_unidade_assunto_livro
  session[:assunto] = params[:assunto_assunto]
   @localizacaos = Localizacao.all(:joins =>' INNER JOIN livros ON localizacaos.livro_id= livros.id  INNER JOIN assuntos on  assuntos.livro_id=livros.id ', :conditions => ["assuntos.assunto=? and localizacaos.unidade_id=?", session[:assunto],session[:unidade] ])
   render :partial => 'lista_consultas_unidade'
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

def load_editoras
      @editoras = Editora.find(:all, :order => 'nome ASC')
end

def load_assuntos
      @assuntos = Assunto.all(:select => "DISTINCT assunto")
end

end
