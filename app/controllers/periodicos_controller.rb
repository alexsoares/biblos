class PeriodicosController < ApplicationController
  # GET /periodicos
  # GET /periodicos.xml
   before_filter :load_unidades
   before_filter :load_periodicos
   before_filter :load_periodicostitulo
   before_filter :load_periodicostipo
   before_filter :load_periodicosperiodicidade

  def index
     if (params[:search].nil? || params[:search].empty?)
      #@unidades = Unidade.find(:all, :order => 'nome ASC')
      @periodicos = Periodico.paginate :page => params[:page], :order => 'titulo ASC', :per_page => 15
      $var = 0
    else
      @periodicos = Periodico.find(:all, :conditions => ["titulo like ?", "%" + params[:search].to_s + "%"], :order => 'titulo ASC')
      $var = 1
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @periodicos }
    end
  end

  # GET /periodicos/1
  # GET /periodicos/1.xml
  def show
    @periodico = Periodico.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @periodico }
    end
  end

  # GET /periodicos/new
  # GET /periodicos/new.xml
  def new
    @periodico = Periodico.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @periodico }
    end
  end

  # GET /periodicos/1/edit
  def edit
    @periodico = Periodico.find(params[:id])
  end

  # POST /periodicos
  # POST /periodicos.xml
  def create
    @periodico = Periodico.new(params[:periodico])

    respond_to do |format|
      if @periodico.save
        flash[:notice] = 'CADASTRADO COM SUCESSO.'
        format.html { redirect_to(@periodico) }
        format.xml  { render :xml => @periodico, :status => :created, :location => @periodico }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @periodico.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /periodicos/1
  # PUT /periodicos/1.xml
  def update
    @periodico = Periodico.find(params[:id])

    respond_to do |format|
      if @periodico.update_attributes(params[:periodico])
        flash[:notice] = 'CADASTRADO COM SUCESSO.'
        format.html { redirect_to(@periodico) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @periodico.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /periodicos/1
  # DELETE /periodicos/1.xml
  def destroy
    @periodico = Periodico.find(params[:id])
    @periodico.destroy

    respond_to do |format|
      format.html { redirect_to(periodicos_url) }
      format.xml  { head :ok }
    end
  end

  def cons_titulo_pe
    render 'cons_titulo'
  end

def lista_titulo
    session[:periodico] = params[:periodico_titulo]
    @periodico = Periodico.find(:all, :conditions => ['titulo =?', session[:periodico]])
    render :partial => 'lista_consultas'
  end

  def cons_unidade_pe
    render 'cons_unidade'
  end

def lista_unidade
    session[:periodico] = params[:periodico_unidade_id]
    @periodico = Periodico.find(:all, :conditions => ['unidade_id=' + session[:periodico]])
    render :partial => 'lista_consultas'
  end

def lista_unidade_titulo
    session[:titulo] = params[:periodico_titulo]
    @periodico = Periodico.find(:all,:conditions => ["titulo =? and unidade_id= ?", session[:titulo], + session[:periodico].to_i] )
    render :partial => 'lista_consultas'
end

def lista_unidade_periodicidade
    session[:periodicidade] = params[:periodico_periodicidade]
    @periodico = Periodico.find(:all, :conditions => ["periodicidade = ? and unidade_id= ?",  session[:periodicidade], + session[:periodico].to_i])
    render :partial => 'lista_consultas'
end

def lista_unidade_tipo
    session[:tipo] = params[:periodico_tipo]
    @periodico = Periodico.find(:all,:conditions => ["tipo =? and unidade_id= ?", session[:tipo], + session[:periodico].to_i] )
    render :partial => 'lista_consultas'
end

  def cons_periodicidade_pe
    render 'cons_periodicidade'
  end

def lista_periodicidade
    $periodicidade = params[:periodico_periodicidade]
    @periodico = Periodico.find(:all, :conditions => ["periodicidade = ?",  $periodicidade])
    render :partial => 'lista_consultas'
  end

 def cons_tipo_pe
    render 'cons_tipo'
  end

def lista_tipo
    $tipo = params[:periodico_tipo]
    @periodico = Periodico.find(:all, :conditions => ["tipo = ?", $tipo])
    render :partial => 'lista_consultas'
  end

 def regras
    render :partial => 'regras'
  end

protected


  def load_unidades
      @unidades = Unidade.find(:all, :order => 'nome ASC')
  end

  def load_periodicos
      @periodicos = Periodico.find(:all, :order => 'titulo ASC')
  end

  def load_periodicostitulo
      @periodicostitulo = Periodico.find(:all, :select => "DISTINCT periodicos.titulo", :order => 'titulo ASC')
  end

  def load_periodicostipo
      @periodicostipo = Periodico.find(:all, :select => "DISTINCT periodicos.tipo", :order => 'tipo ASC')
  end

def load_periodicosperiodicidade
      @periodicosperiodicidade = Periodico.find(:all, :select => "DISTINCT periodicos.periodicidade", :order => 'tipo ASC')
      
  end
end
