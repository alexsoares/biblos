class IsbnsController < ApplicationController
  # GET /isbns
  # GET /isbns.xml
    before_filter :load_editoras


  def index
    if (params[:search].nil? || params[:search].empty?)
     @isbns = Isbn.paginate :page => params[:page], :order => 'titulo ASC', :per_page => 15
      $var = 0
    else
     @isbns = Isbn.find(:all, :conditions => ["titulo like ?", "%" + params[:search].to_s + "%"], :order => 'titulo ASC')
      $var = 1
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @isbns }
    end
  end

  # GET /isbns/1
  # GET /isbns/1.xml
  def show
    @isbn = Isbn.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @isbn }
    end
  end

  # GET /isbns/new
  # GET /isbns/new.xml
  def new
    @isbn = Isbn.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @isbn }
    end
  end

  # GET /isbns/1/edit
  def edit
    @isbn = Isbn.find(params[:id])
  end

  # POST /isbns
  # POST /isbns.xml
  def create
    @isbn = Isbn.new(params[:isbn])

    respond_to do |format|
      if @isbn.save
        flash[:notice] = 'CADASTRADO COM SUCESSO.'
        format.html { redirect_to(@isbn) }
        format.xml  { render :xml => @isbn, :status => :created, :location => @isbn }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @isbn.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /isbns/1
  # PUT /isbns/1.xml
  def update
    @isbn = Isbn.find(params[:id])

    respond_to do |format|
      if @isbn.update_attributes(params[:isbn])
        flash[:notice] = 'CADASTRADO COM SUCESSO.'
        format.html { redirect_to(@isbn) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @isbn.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /isbns/1
  # DELETE /isbns/1.xml
  def destroy
    @isbn = Isbn.find(params[:id])
    @isbn.destroy

    respond_to do |format|
      format.html { redirect_to(homes_path) }
      format.xml  { head :ok }
    end
  end

  protected

  def load_editoras
      @editoras = Editora.find(:all,  :order => 'nome ASC')
end
end
