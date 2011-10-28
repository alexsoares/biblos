class MapasController < ApplicationController
  before_filter :load_unidades
  before_filter :load_editoras


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
    1.times do
      @mapa.localizacaos.build
    end
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

 def regras
    render :partial => 'regras'
  end

 protected

  def load_unidades
    @unidades = Unidade.find(:all, :order => 'nome ASC')
  end

  def load_editoras
      @editoras = Editora.find(:all,  :order => 'nome ASC')
end


end
