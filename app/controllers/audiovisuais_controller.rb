class AudiovisuaisController < ApplicationController
before_filter :load_generomidias
before_filter :load_generos
before_filter :load_unidades
before_filter :load_audiovisuaistitulo
before_filter :load_musicas

  # GET /audiovisuais
  # GET /audiovisuais.xml
  def index
       if (params[:search].nil? || params[:search].empty?)
      @audiovisuais = Audiovisuai.paginate :page => params[:page], :order => 'titulo ASC', :per_page => 15
      $var = 0
    else
      @audiovisuais = Audiovisuai.find(:all, :conditions => ["titulo like ?", "%" + params[:search].to_s + "%"], :order => 'titulo ASC')
      $var = 1
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @audiovisuais }
    end
  end

  # GET /audiovisuais/1
  # GET /audiovisuais/1.xml
  def show
    @audiovisuai = Audiovisuai.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @audiovisuai }
    end
  end

  # GET /audiovisuais/new
  # GET /audiovisuais/new.xml
  def new
    @audiovisuai = Audiovisuai.new
    1.times do
      @audiovisuai.localizacaos.build
    end
        1.times do
      @audiovisuai.musicas.build
    end
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @audiovisuai }
    end
  end

  # GET /audiovisuais/1/edit
  def edit
    @audiovisuai = Audiovisuai.find(params[:id])
  end

  # POST /audiovisuais
  # POST /audiovisuais.xml
  def create
    @audiovisuai = Audiovisuai.new(params[:audiovisuai])
    respond_to do |format|
      if @audiovisuai.save
        flash[:notice] = 'Audiovisuai was successfully created.'
        format.html { redirect_to(@audiovisuai) }
        format.xml  { render :xml => @audiovisuai, :status => :created, :location => @audiovisuai }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @audiovisuai.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /audiovisuais/1
  # PUT /audiovisuais/1.xml
  def update
    @audiovisuai = Audiovisuai.find(params[:id])

    respond_to do |format|
      if @audiovisuai.update_attributes(params[:audiovisuai])
        flash[:notice] = 'Audiovisuai was successfully updated.'
        format.html { redirect_to(@audiovisuai) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @audiovisuai.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /audiovisuais/1
  # DELETE /audiovisuais/1.xml
  def destroy
    @audiovisuai = Audiovisuai.find(params[:id])
    @audiovisuai.destroy

    respond_to do |format|
      format.html { redirect_to(audiovisuais_url) }
      format.xml  { head :ok }
    end
  end
  
  def regras
    render :partial => 'regras'
  end

  def cons_genero_av
    render 'cons_genero'
  end

def camposmusicas
  $teste = params[:audiovisuai_generomidia_id]
 if ($teste == '21')
    render :partial => 'camposmusicas'
 end
end


def lista_genero
     session[:audiovisuai] = params[:audiovisuai_generomidia_id]
    @audiovisuais = Audiovisuai.find(:all, :conditions => ['generomidia_id=' + session[:audiovisuai]])
    render :partial => 'lista_consultas'
  end
  
def titulo
 if (params[:search].nil? || params[:search].empty?)
     render 'consultaA'
 else
    @audiovisuais = Audiovisuai.find(:all, :conditions => ["titulo like ?", "%" + params[:search].to_s + "%"], :order => 'titulo ASC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @audiovisuais }
    end
 end
 end

  def cons_unidade_av
   if (params[:searchUnidade_av].nil? || params[:searchUnidade_av].empty?)
      render 'cons_unidade'
   else
      @audiovisuais = Audiovisuai.find(:all, :conditions => ["titulo like ? and unidade_id=?", "%" + params[:searchUnidade_av].to_s + "%", session[:audiovisuai]], :order => 'titulo ASC')
   end
 end

def lista_unidade
    session[:audiovisuai] = params[:audiovisuai_unidade_id]
    @localizacaos = Localizacao.find(:all,  :conditions =>['unidade_id= ?', session[:unidade]])
   render :partial => 'lista_consultas_unidade'
  end

def lista_unidade_genero_av
    session[:genero] = params[:audiovisuai_generomidia_id]
      @localizacaos = Localizacao.all(:joins => :audiovisuai, :conditions => ["audiovisuais.generomidia_id=? and unidade_id=?", session[:genero],  session[:unidade]] )
  render :partial => 'lista_consultas_unidade'
end


def lista_unidade_midia_av
    session[:midia] = params[:audiovisuai_tipo]
      @localizacaos = Localizacao.all(:joins => :audiovisuai, :conditions => ["audiovisuais.tipo=? and unidade_id=?", session[:midia],  session[:unidade]] )
  render :partial => 'lista_consultas_unidade'
end

def lista_unidade_titulo
     session[:titulo] = params[:audiovisuai_titulo]
     @localizacaos = Localizacao.all(:joins => :audiovisuai, :conditions => ["audiovisuais.titulo=? and unidade_id=?", session[:titulo],  session[:unidade]] )
    render :partial => 'lista_consultas_unidade'
end
protected

def load_generos
      @generos = Generomidia.find(:all, :order => 'nome ASC')
end

  def load_generomidias
      @generomidias = Generomidia.find(:all, :order => 'nome ASC')
  end
def load_unidades
      @unidades = Unidade.find(:all, :order => 'nome ASC')
end
def load_audiovisuaistitulo
    @audiovisuaistitulo = Audiovisuai.find(:all, :select => "DISTINCT audiovisuais.titulo", :order => 'titulo ASC')
end

def load_musicas
      @musicas = Musica.find(:all, :order => 'nome ASC')
end

end
