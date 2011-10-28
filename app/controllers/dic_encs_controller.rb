class DicEncsController < ApplicationController
  before_filter :load_identificacaos
  before_filter :load_unidades
  before_filter :load_editoras

  # GET /dic_encs
  # GET /dic_encs.xml
  def index
     if (params[:search].nil? || params[:search].empty?)
     @dic_encs = DicEnc.paginate :page => params[:page], :per_page => 15
      $var = 0
    else
      @dic_encs = DicEnc.find(:all, :joins=> :identificacao, :conditions => ["titulo like ?", "%" + params[:search].to_s + "%"])
      $var = 1
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dic_encs }
    end
  end

  # GET /dic_encs/1
  # GET /dic_encs/1.xml
  def show
    @dic_enc = DicEnc.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dic_enc }
    end
  end

  # GET /dic_encs/new
  # GET /dic_encs/new.xml
  def new
    @dic_enc = DicEnc.new
    1.times do
      @dic_enc.localizacaos.build
    end
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dic_enc }
    end
  end

  # GET /dic_encs/1/edit
  def edit
    @dic_enc = DicEnc.find(params[:id])
  end

  # POST /dic_encs
  # POST /dic_encs.xml
  def create
    @dic_enc = DicEnc.new(params[:dic_enc])

    respond_to do |format|
      if @dic_enc.save
        flash[:notice] = 'DicEnc was successfully created.'
        format.html { redirect_to(@dic_enc) }
        format.xml  { render :xml => @dic_enc, :status => :created, :location => @dic_enc }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dic_enc.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /dic_encs/1
  # PUT /dic_encs/1.xml
  def update
    @dic_enc = DicEnc.find(params[:id])

    respond_to do |format|
      if @dic_enc.update_attributes(params[:dic_enc])
        flash[:notice] = 'DicEnc was successfully updated.'
        format.html { redirect_to(@dic_enc) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dic_enc.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /dic_encs/1
  # DELETE /dic_encs/1.xml
  def destroy
    @dic_enc = DicEnc.find(params[:id])
    @dic_enc.destroy

    respond_to do |format|
      format.html { redirect_to(dic_encs_url) }
      format.xml  { head :ok }
    end
  end

  def regras
    render :partial => 'regras'
  end

 def identificador
    session[:numero] = params[:dic_enc_identificacao_id].to_i
      @identificacao = Identificacao.find(session[:numero])
    render :partial => "identificador"
  end
protected

def load_unidades
      @unidades = Unidade.find(:all, :order => 'nome ASC')
  end

def load_identificacaos
      @identificacaos = Identificacao.find(:all, :order=> 'titulo ASC')
end

def load_editoras
      @editoras = Editora.find(:all, :order => 'nome ASC')
end
end
