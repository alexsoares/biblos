class LivrosController < ApplicationController
  # GET /livros
  # GET /livros.xml

  before_filter :load_areas
  before_filter :load_unidades
  before_filter :load_assuntos
  before_filter :load_arealivros
  before_filter :load_isbnlivros
  before_filter :load_titulolivros
  before_filter :load_autorlivros
  before_filter :load_editoras
  before_filter :load_isbns

  def index
     if (params[:search].nil? || params[:search].empty?)
     @livros = Livro.paginate :page => params[:page], :per_page => 15
      $var = 0
    else
      @livros = Livro.find(:all, :conditions => ["titulo like ?", "%" + params[:search].to_s + "%"])
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

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @livro }
    end
  end

  def dados_isbn
    session[:numero] = params[:livro_isbn_id].to_i
    @isbn = Isbn.find(session[:numero])
    render :partial => "isbn"
  end

  # GET /livros/1/edit
  def edit
     @livro = Livro.find(params[:id])
     session[:numero] = @livro.isbn_id
     @isbn = Isbn.find_by_nisbn(session[:numero])

 end
def novo_isbn
     session[:numero] = params[:livro_isbn_id]
     @isbn = Isbn.find_by_nisbn(session[:numero])
 #   @livro= Isbn.find(:all, :conditions => ['isbn_id=' + session[:numero]])
     render :partial => 'lista'
 end
  

  # POST /livros
  # POST /livros.xml
  def create
    @livro = Livro.new(params[:livro])

    respond_to do |format|
      if @livro.save
        flash[:notice] = 'CADASTRADO COM SUCESSO.'
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
        flash[:notice] = 'CADASTRADO COM SUCESSO.'
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

  def cons_titulo_livro
    render 'cons_titulo'
  end

def lista_titulo
    session[:titulo] = params[:livro_isbn_id]
    @livros = Livro.find(:all, :conditions => ["isbn_id =? " , session[:titulo]])
    render :partial => 'lista_consultas'
  end

 def cons_area_livro
    render 'cons_area'
  end

def lista_area
     $area = params[:livro_area_id]
    @livros = Livro.find(:all, :conditions => ['area_id='+ $area])
    render :partial => 'lista_consultas'
  end


  def cons_assunto_livro
    render 'cons_assunto'
  end

def lista_assunto
    session[:assunto] = params[:assunto_nome]
    @livros = Livro.find(:all, :conditions => ["assunto1 = ? or assunto2 = ? or assunto3 = ?",  session[:assunto], session[:assunto], session[:assunto]])
    render :partial => 'lista_consultas'
  end

  def cons_isbn_livro
    render 'cons_isbn'
  end

def lista_isbn
      session[:isbn] = params[:livro_isbn_id]
     @livros = Livro.find(:all, :conditions => ["isbn_id =?", session[:isbn]])
     render :partial => 'lista_consultas'
   end


 def cons_unidade_livro
    render 'cons_unidade'
  end

def lista_unidade
      session[:unidade] = params[:livro_unidade_id]
     @livros = Livro.find(:all, :conditions => ['unidade_id=' + session[:unidade]])
     render :partial => 'lista_consultas'
   end

def lista_unidade_area_livro
    session[:area] = params[:livro_area_id]
    @livros = Livro.find(:all,:conditions => ["area_id=? and unidade_id= ?", +session[:area].to_i, + session[:unidade].to_i] )
    render :partial => 'lista_consultas'
end


def lista_unidade_assunto_livro
    session[:assunto] = params[:assunto_nome]
    @livros = Livro.find(:all, :conditions => ["(assunto1 = ? or assunto2 = ? or assunto3 = ?) and unidade_id= ?",  session[:assunto], session[:assunto], session[:assunto], +  session[:unidade].to_i])
    render :partial => 'lista_consultas'
end


def lista_unidade_titulo_livro
    session[:titulo] = params[:livro_isbn_id]
    @livros = Livro.find(:all, :conditions => ["isbn_id =? and unidade_id= ? " , session[:titulo], +session[:unidade].to_i])
    render :partial => 'lista_consultas'
end

  def regras
    render :partial => 'regras'
  end



def lista_unidade_autor_livro
 session[:autor] = params[:isbn_autor]
 @livros = Livro.find(:all, :joins=> :isbn , :conditions => ['isbns.autor =? and unidade_id= ? ' , session[:autor],+session[:unidade].to_i])
 render :partial => 'lista_consultas'
end

protected

  def load_areas
      @areas = Area.find(:all, :order => 'nome ASC')
  end

  def load_unidades
      @unidades = Unidade.find(:all, :order => 'nome ASC')
  end

  def load_assuntos
      @assuntos = Assunto.find(:all,:order => 'nome ASC')
  end

def load_editoras
      @editoras = Editora.find(:all,  :order => 'nome ASC')
end

def load_isbns
      @isbns = Isbn.find(:all, :order=> 'titulo ASC')
end

def load_arealivros
      @arealivros = Area.find(:all, :order => 'nome ASC')
end

def load_isbnlivros
      @isbnlivros = Livro.find(:all, :select => "DISTINCT livros.isbn_id" )
end

def load_titulolivros
      @titulolivros = Isbn.find(:all, :order => 'titulo ASC' )
end

def load_autorlivros
      @autorlivros = Isbn.find(:all, :order => 'autor ASC' )
end

end