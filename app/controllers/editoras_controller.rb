class EditorasController < ApplicationController
  # GET /editoras
  # GET /editoras.xml
  def index
    @editoras = Editora.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @editoras }
    end
  end

  # GET /editoras/1
  # GET /editoras/1.xml
  def show
    @editora = Editora.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @editora }
    end
  end

  # GET /editoras/new
  # GET /editoras/new.xml
  def new
    @editora = Editora.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @editora }
    end
  end

  # GET /editoras/1/edit
  def edit
    @editora = Editora.find(params[:id])
  end

  # POST /editoras
  # POST /editoras.xml
  def create
    @editora = Editora.new(params[:editora])

    respond_to do |format|
      if @editora.save
        flash[:notice] = 'CADASTRADO COM SUCESSSO.'
        format.html { redirect_to(new_editora_path) }
        format.xml  { render :xml => @editora, :status => :created, :location => @editora }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @editora.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /editoras/1
  # PUT /editoras/1.xml
  def update
    @editora = Editora.find(params[:id])

    respond_to do |format|
      if @editora.update_attributes(params[:editora])
        flash[:notice] = 'CADASTRADO COM SUCESSSO.'
        format.html { redirect_to(@editora) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @editora.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /editoras/1
  # DELETE /editoras/1.xml
  def destroy
    @editora = Editora.find(params[:id])
    @editora.destroy

    respond_to do |format|
      format.html { redirect_to(homes_path) }
      format.xml  { head :ok }
    end
  end

  def lista
    @editora = Editora.find(:all)
    render :partial => 'lista_editora'

  end

end
