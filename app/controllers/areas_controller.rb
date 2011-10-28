class AreasController < ApplicationController
  # GET /areas
  # GET /areas.xml
  def index
    @areas = Area.all(:select => 'distinct area')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @areas }
    end
  end

  # GET /areas/1
  # GET /areas/1.xml
  def show
    @area = Area.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @area }
    end
  end

  # GET /areas/new
  # GET /areas/new.xml
  def new
    @area = Area.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @area }
    end
  end

  # GET /areas/1/edit
  def edit
    @area = Area.find(params[:id])
  end

  # POST /areas
  # POST /areas.xml
  def create
    @area = Area.new(params[:area])

    respond_to do |format|
      if @area.save
        flash[:notice] = 'CADASTRADO COM SUCESSO'
        format.html { redirect_to(new_area_path) }
        format.xml  { render :xml => @area, :status => :created, :location => @area }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @area.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /areas/1
  # PUT /areas/1.xml
  def update
    @area = Area.find(params[:id])

    respond_to do |format|
      if @area.update_attributes(params[:area])
        flash[:notice] = 'CADASTRADO COM SUCESSO.'
        format.html { redirect_to(@area) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @area.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /areas/1
  # DELETE /areas/1.xml
  def destroy
    @area = Area.find(params[:id])
    @area.destroy

    respond_to do |format|
      format.html { redirect_to(areas_url) }
      format.xml  { head :ok }
    end
  end


def mesma_area
    $area = params[:area_area]
    @verifica = Area.find_by_area($area)
    if @verifica then
      render :update do |page|
        page.replace_html 'nome_aviso', :text => 'ÁREA JÁ CADASTRADA, clicar botão VOLTAR para cadastrar nova ÁREA'
        page.replace_html 'Certeza', :text => "<input id='editora_submit' name='commit' onclick=\"return confirm('SALVAR NOME DUPLICADO?');\" type='submit' value='SALVAR ?? ' />"
    end
    else
      render :update do |page|
        page.replace_html 'nome_aviso', :text => ''
      end
    end
  end
end
