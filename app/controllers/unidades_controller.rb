class UnidadesController < ApplicationController
  # GET /unidades
  # GET /unidades.xml

   before_filter :load_unidades
   before_filter :load_tipos

def load_tipos
    @tipos =Tipo.find(:all, :order => 'nome ASC')
  end

   def load_unidades
    @unidades = Unidade.find(:all, :order => 'nome ASC')
  end
  
  def index
    if (params[:search].nil? || params[:search].empty?)
      #@unidades = Unidade.find(:all, :order => 'nome ASC')
      @unidades = Unidade.paginate :page => params[:page], :order => 'nome ASC', :per_page => 15
      $var = 0
    else
      @unidades = Unidade.find(:all, :conditions => ["nome like ?", "%" + params[:search].to_s + "%"], :order => 'nome ASC')
      $var = 1
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @unidades }
    end
  end

  # GET /unidades/1
  # GET /unidades/1.xml
  def show
    @unidades = Unidade.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @unidades }
    end
  end

  # GET /unidades/new
  # GET /unidades/new.xml
  def new
    @unidades = Unidade.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @unidades }
    end
  end

  # GET /unidades/1/edit
  def edit
    @unidades = Unidade.find(params[:id])
  end

  # POST /unidades
  # POST /unidades.xml
  def create
    @unidades = Unidade.new(params[:unidade])
    respond_to do |format|
      if @unidades.save
        flash[:notice] = 'CADASTRADO COM SUCESSO.'
        format.html { redirect_to(@unidades) }
        format.xml  { render :xml => @unidades, :status => :created, :location => @unidades }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @unidades.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /unidades/1
  # PUT /unidades/1.xml
  def update
    @unidades = Unidade.find(params[:id])

    respond_to do |format|
      if @unidades.update_attributes(params[:unidade])
        flash[:notice] = 'CADASTRADO COM SUCESSO.'
        format.html { redirect_to(@unidades) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @unidades.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /unidades/1
  # DELETE /unidades/1.xml
  def destroy
    @unidades = Unidade.find(params[:id])
    @unidades.destroy

  respond_to do |format|
      format.html { redirect_to(homes_path) }
      format.xml  { head :ok }
    end
  end

def mesmo_nome
    $nome = params[:unidade_nome]
    @verifica = Unidade.find_by_nome($nome)
    if @verifica then
      render :update do |page|
        page.replace_html 'nome_aviso', :text => 'UNIDADE JÁ CADASTRADA NO SISTEMA'
        page.replace_html 'Certeza', :text =>'UNIDADE JÁ CADASTRADA NO SISTEMA'
    end
    else
      render :update do |page|
        page.replace_html 'nome_aviso', :text => ''
      end

    end
  end


def consulta
    render 'consultas'
  end

def lista_unidade
    $unidade = params[:unidade_unidade_id]
    @unidades = Unidade.find(:all, :conditions => ['id=' + $unidade])
    render :partial => 'lista_unidades'
  end

def consultatipo
    render 'consultastipo'
  end

def lista_tipo
    $tipo = params[:unidade_tipo_id]
    @tipos = Unidade.find(:all, :conditions => ['tipo_id=' + $tipo])
    render :partial => 'lista_tipos'
  end


def print_all
   @unidades = Unidade.find(:all, :order => 'nome ASC')
   end

 def por_endereco
    if (params[:searche].nil? || params[:searche].empty?)
      @unidades = Unidade.paginate :page => params[:page], :order => 'nome ASC', :per_page => 15
      $var = 0
    else
      @unidades = Unidade.find(:all, :conditions => ["endereco like ?", "%" + params[:searche].to_s + "%"], :order => 'nome ASC')
      $var = 1
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @unidades }
    end
  end
end
