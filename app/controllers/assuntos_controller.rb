class AssuntosController < ApplicationController
  # GET /assuntos
  # GET /assuntos.xml
  def index
    @assuntos = Assunto.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @assuntos }
    end
  end

  # GET /assuntos/1
  # GET /assuntos/1.xml
  def show
    @assunto = Assunto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @assunto }
    end
  end

  # GET /assuntos/new
  # GET /assuntos/new.xml
  def new
    @assunto = Assunto.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @assunto }
    end
  end

  # GET /assuntos/1/edit
  def edit
    @assunto = Assunto.find(params[:id])
  end

  # POST /assuntos
  # POST /assuntos.xml
  def create
    @assunto = Assunto.new(params[:assunto])

    respond_to do |format|
      if @assunto.save
        flash[:notice] = 'CADASTRADO COM SUCESSO.'
        format.html { redirect_to(new_assunto_path) }
        format.xml  { render :xml => @assunto, :status => :created, :location => @assunto }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @assunto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /assuntos/1
  # PUT /assuntos/1.xml
  def update
    @assunto = Assunto.find(params[:id])

    respond_to do |format|
      if @assunto.update_attributes(params[:assunto])
        flash[:notice] = 'CADASTRADO COM SUCESSO.'
        format.html { redirect_to(@assunto) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @assunto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /assuntos/1
  # DELETE /assuntos/1.xml
  def destroy
    @assunto = Assunto.find(params[:id])
    @assunto.destroy

    respond_to do |format|
      format.html { redirect_to(homes_path) }
      format.xml  { head :ok }
    end
  end

def lista
    @assunto = Assunto.find(:all)
    render :partial => 'lista_assunto'

  end
end
