class IdentificacaosController < ApplicationController
  # GET /identificacaos
  # GET /identificacaos.xml
  def index
    if (params[:search].nil? || params[:search].empty?)
     @identificacaos = Identificacao.paginate :page => params[:page], :order => 'titulo ASC', :per_page => 15
      $var = 0
    else
     @identificacaos = Identificacao.find(:all, :conditions => ["titulo like ?", "%" + params[:search].to_s + "%"], :order => 'titulo ASC')
      $var = 1
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @identificacaos }
    end
  end

  # GET /identificacaos/1
  # GET /identificacaos/1.xml
  def show
    @identificacao = Identificacao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @identificacao }
    end
  end

  # GET /identificacaos/new
  # GET /identificacaos/new.xml
  def new
    @identificacao = Identificacao.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @identificacao }
    end
  end

  # GET /identificacaos/1/edit
  def edit
    @identificacao = Identificacao.find(params[:id])
  end

  # POST /identificacaos
  # POST /identificacaos.xml
  def create
    @identificacao = Identificacao.new(params[:identificacao])

    respond_to do |format|
      if @identificacao.save
        flash[:notice] = 'Identificacao was successfully created.'
        format.html { redirect_to(@identificacao) }
        format.xml  { render :xml => @identificacao, :status => :created, :location => @identificacao }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @identificacao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /identificacaos/1
  # PUT /identificacaos/1.xml
  def update
    @identificacao = Identificacao.find(params[:id])

    respond_to do |format|
      if @identificacao.update_attributes(params[:identificacao])
        flash[:notice] = 'Identificacao was successfully updated.'
        format.html { redirect_to(@identificacao) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @identificacao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /identificacaos/1
  # DELETE /identificacaos/1.xml
  def destroy
    @identificacao = Identificacao.find(params[:id])
    @identificacao.destroy

    respond_to do |format|
      format.html { redirect_to(identificacaos_url) }
      format.xml  { head :ok }
    end
  end

 def regras
    render :partial => 'regras'
  end


end
