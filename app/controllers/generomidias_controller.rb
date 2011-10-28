class GeneromidiasController < ApplicationController
  # GET /generomidias
  # GET /generomidias.xml
  def index
    @generomidias = Generomidia.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @generomidias }
    end
  end

  # GET /generomidias/1
  # GET /generomidias/1.xml
  def show
    @generomidia = Generomidia.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @generomidia }
    end
  end

  # GET /generomidias/new
  # GET /generomidias/new.xml
  def new
    @generomidia = Generomidia.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @generomidia }
    end
  end

  # GET /generomidias/1/edit
  def edit
    @generomidia = Generomidia.find(params[:id])
  end

  # POST /generomidias
  # POST /generomidias.xml
  def create
    @generomidia = Generomidia.new(params[:generomidia])

    respond_to do |format|
      if @generomidia.save
        flash[:notice] = 'CADASTRADO COM SUCESSO.'
        format.html { redirect_to(new_generomidia_path) }
        format.xml  { render :xml => @generomidia, :status => :created, :location => @generomidia }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @generomidia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /generomidias/1
  # PUT /generomidias/1.xml
  def update
    @generomidia = Generomidia.find(params[:id])

    respond_to do |format|
      if @generomidia.update_attributes(params[:generomidia])
        flash[:notice] = 'CADASTRADO COM SUCESSO'
        format.html { redirect_to(@generomidia) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @generomidia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /generomidias/1
  # DELETE /generomidias/1.xml
  def destroy
    @generomidia = Generomidia.find(params[:id])
    @generomidia.destroy

    respond_to do |format|
      format.html { redirect_to(homes_path) }
      format.xml  { head :ok }
    end
  end

def lista
    @generomidia = Generomidia.find(:all)
    render :partial => 'lista_genero'

  end

def mesmo_nome
    $nome = params[:generomidia_nome]
    @verifica = Generomidia.find_by_nome($nome)
    if @verifica then
      render :update do |page|
        page.replace_html 'nome_aviso', :text => 'GÊNERO JÁ CADASTRADA, clicar botão VOLTAR para cadastrar novo GÊNERO'
        page.replace_html 'Certeza', :text => "<input id='editora_submit' name='commit' onclick=\"return confirm('SALVAR NOME DUPLICADO?');\" type='submit' value='SALVAR ?? ' />"
    end
    else
      render :update do |page|
        page.replace_html 'nome_aviso', :text => ''
      end
    end
  end

end
