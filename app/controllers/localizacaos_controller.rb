class LocalizacaosController < ApplicationController
  # GET /localizacaos
  # GET /localizacaos.xml
  def index
    @localizacaos = Localizacao.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @localizacaos }
    end
  end

  # GET /localizacaos/1
  # GET /localizacaos/1.xml
  def show
    @localizacao = Localizacao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @localizacao }
    end
  end

  # GET /localizacaos/new
  # GET /localizacaos/new.xml
  def new
    @localizacao = Localizacao.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @localizacao }
    end
  end

  # GET /localizacaos/1/edit
  def edit
    @localizacao = Localizacao.find(params[:id])
  end

  # POST /localizacaos
  # POST /localizacaos.xml
  def create
    @localizacao = Localizacao.new(params[:localizacao])

    respond_to do |format|
      if @localizacao.save
        flash[:notice] = 'Localizacao was successfully created.'
        format.html { redirect_to(@localizacao) }
        format.xml  { render :xml => @localizacao, :status => :created, :location => @localizacao }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @localizacao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /localizacaos/1
  # PUT /localizacaos/1.xml
  def update
    @localizacao = Localizacao.find(params[:id])

    respond_to do |format|
      if @localizacao.update_attributes(params[:localizacao])
        flash[:notice] = 'Localizacao was successfully updated.'
        format.html { redirect_to(@localizacao) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @localizacao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /localizacaos/1
  # DELETE /localizacaos/1.xml
  def destroy
    @localizacao = Localizacao.find(params[:id])
    @localizacao.destroy

    respond_to do |format|
      format.html { redirect_to(localizacaos_url) }
      format.xml  { head :ok }
    end
  end
end
