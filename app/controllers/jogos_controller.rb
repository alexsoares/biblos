class JogosController < ApplicationController
  # GET /jogos
  # GET /jogos.xml

  before_filter :load_unidades
  before_filter :load_jogostitulo

  def index
     if (params[:search].nil? || params[:search].empty?)
       @jogos = Jogo.paginate :page => params[:page], :order => 'nome ASC', :per_page => 15
      $var = 0
    else
       @jogos = Jogo.find(:all, :conditions => ["nome like ?", "%" + params[:search].to_s + "%"], :order => 'nome ASC')
      $var = 1
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @jogos }
    end
  end

  # GET /jogos/1
  # GET /jogos/1.xml
  def show
    @jogo = Jogo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @jogo }
    end
  end

  # GET /jogos/new
  # GET /jogos/new.xml
  def new
    @jogo = Jogo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @jogo }
    end
  end

  # GET /jogos/1/edit
  def edit
    @jogo = Jogo.find(params[:id])
  end

  # POST /jogos
  # POST /jogos.xml
  def create
    @jogo = Jogo.new(params[:jogo])

    respond_to do |format|
      if @jogo.save
        flash[:notice] = 'CADASTRADO COM SUCESSO.'
        format.html { redirect_to(@jogo) }
        format.xml  { render :xml => @jogo, :status => :created, :location => @jogo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @jogo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /jogos/1
  # PUT /jogos/1.xml
  def update
    @jogo = Jogo.find(params[:id])

    respond_to do |format|
      if @jogo.update_attributes(params[:jogo])
        flash[:notice] = 'CADASTRADO COM SUCESSO.'
        format.html { redirect_to(@jogo) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @jogo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /jogos/1
  # DELETE /jogos/1.xml
  def destroy
    @jogo = Jogo.find(params[:id])
    @jogo.destroy

    respond_to do |format|
      format.html { redirect_to(jogos_url) }
      format.xml  { head :ok }
    end
  end

    def cons_faixaetaria_jogo
    render 'cons_faixaetaria'
  end

def lista_faixaetaria
     session[:faixa] = params[:jogo_faixaetaria]
    @jogos = Jogo.find(:all, :conditions => ['faixaetaria = ?', session[:faixa]])
    render :partial => 'lista_consultas'
  end

def cons_titulo_jogo
    render 'cons_titulo'
  end

def lista_titulo
    session[:titulo] = params[:jogo_nome]
    @jogos = Jogo.find(:all, :conditions => ["nome =? " , session[:titulo]])
    render :partial => 'lista_consultas'
  end

def cons_unidade_jogo
   if (params[:searchUnidade_jogo].nil? || params[:searchUnidade_jogo].empty?)
      render 'cons_unidade'
   else
      @jogos = Jogo.find(:all, :conditions => ["nome like ? and unidade_id=?", "%" + params[:searchUnidade_jogo].to_s + "%", session[:mapa]], :order => 'titulo ASC')
   end
 end


def lista_unidade
    session[:jogo] = params[:jogo_unidade_id]
    @jogos = Jogo.find(:all, :conditions => ['unidade_id=' + session[:jogo]])
   render :partial => 'lista_consultas'
  end

def lista_unidade_titulo
     session[:nome] = params[:jogo_nome]
    @jogos = Jogo.find(:all,:conditions => ["nome =? and unidade_id= ?",  session[:nome], +  session[:jogo].to_i] )
    render :partial => 'lista_consultas'
end

def lista_unidade_faixaetaria
     session[:faixa] = params[:jogo_faixaetaria]
     @jogos = Jogo.find(:all,:conditions => ["faixaetaria=? and unidade_id= ?",  session[:faixa], +  session[:jogo].to_i] )
    render :partial => 'lista_consultas'
end

 def regras
    render :partial => 'regras'
  end

protected


  def load_unidades
      @unidades = Unidade.find(:all, :order => 'nome ASC')
  end

def load_jogostitulo
    @jogostitulo = Jogo.find(:all, :select => "DISTINCT jogos.nome", :order => 'nome ASC')
end

end
