class MapasController < ApplicationController
  # GET /mapas
  # GET /mapas.xml

  before_filter :load_unidades
  before_filter :load_editoras
  before_filter :load_mapastitulo

  def index
     if (params[:search].nil? || params[:search].empty?)
      @mapas = Mapa.paginate :page => params[:page], :order => 'titulo ASC', :per_page => 15
      $var = 0
    else
      @mapas = Mapa.find(:all, :conditions => ["titulo like ?", "%" + params[:search].to_s + "%"], :order => 'titulo ASC')
      $var = 1
     end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mapas }
    end
  end

  # GET /mapas/1
  # GET /mapas/1.xml
  def show
    @mapa = Mapa.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mapa }
    end
  end

  # GET /mapas/new
  # GET /mapas/new.xml
  def new
    @mapa = Mapa.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mapa }
    end
  end

  # GET /mapas/1/edit
  def edit
    @mapa = Mapa.find(params[:id])
  end

  # POST /mapas
  # POST /mapas.xml
  def create
    @mapa = Mapa.new(params[:mapa])

    respond_to do |format|
      if @mapa.save
        flash[:notice] = 'Mapa was successfully created.'
        format.html { redirect_to(@mapa) }
        format.xml  { render :xml => @mapa, :status => :created, :location => @mapa }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mapa.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mapas/1
  # PUT /mapas/1.xml
  def update
    @mapa = Mapa.find(params[:id])

    respond_to do |format|
      if @mapa.update_attributes(params[:mapa])
        flash[:notice] = 'Mapa was successfully updated.'
        format.html { redirect_to(@mapa) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mapa.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mapas/1
  # DELETE /mapas/1.xml
  def destroy
    @mapa = Mapa.find(params[:id])
    @mapa.destroy

    respond_to do |format|
      format.html { redirect_to(mapas_url) }
      format.xml  { head :ok }
    end
  end

def cons_unidade_mapa
   if (params[:searchUnidade_mapa].nil? || params[:searchUnidade_mapa].empty?)
      render 'cons_unidade'
   else
      @mapas = Mapa.find(:all, :conditions => ["titulo like ? and unidade_id=?", "%" + params[:searchUnidade_av].to_s + "%", session[:mapa]], :order => 'titulo ASC')
   end
 end

  def cons_tipo_mapa
    render 'cons_tipo'
  end

def lista_tipo
     session[:tipo] = params[:mapa_tipo]
    @mapas = Mapa.find(:all, :conditions => ['tipo = ?', session[:tipo]])
    render :partial => 'lista_consultas'
  end


def cons_titulo_mapa
    render 'cons_titulo'
  end

def lista_titulo
    session[:titulo] = params[:mapa_titulo]
    @mapas = Mapa.find(:all, :conditions => ["titulo =? " , session[:titulo]])
    render :partial => 'lista_consultas'
  end

def lista_unidade
    session[:mapa] = params[:mapa_unidade_id]
    @mapas = Mapa.find(:all, :conditions => ['unidade_id=' + session[:mapa]])
   render :partial => 'lista_consultas'
  end

def lista_unidade_titulo
     session[:titulo] = params[:mapa_titulo]
    @mapas = Mapa.find(:all,:conditions => ["titulo =? and unidade_id= ?",  session[:titulo], +  session[:mapa].to_i] )
    render :partial => 'lista_consultas'
end

def lista_unidade_tipo
     session[:tipo] = params[:mapa_tipo]
     @mapas = Mapa.find(:all,:conditions => ["tipo=? and unidade_id= ?",  session[:tipo], +  session[:mapa].to_i] )
    render :partial => 'lista_consultas'
end

 def regras
    render :partial => 'regras'
  end

protected

  def load_unidades
    @unidades = Unidade.find(:all, :order => 'nome ASC')
  end

def load_mapastitulo
    @mapastitulo = Mapa.find(:all, :select => "DISTINCT mapas.titulo", :order => 'titulo ASC')
end

  def load_editoras
      @editoras = Editora.find(:all,  :order => 'nome ASC')
end
end