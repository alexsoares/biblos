class PeriodicosController < ApplicationController
  before_filter :load_unidades
  before_filter :load_editoras

  # GET /periodicos
  # GET /periodicos.xml
  def index
       if (params[:search].nil? || params[:search].empty?)
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
    1.times do
      @periodico.localizacaos.build
    end
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
        flash[:notice] = 'Periodico was successfully created.'
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
        flash[:notice] = 'Periodico was successfully updated.'
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
