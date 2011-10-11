class AudiovisuaisController < ApplicationController
  # GET /audiovisuais
  # GET /audiovisuais.xml
  def index
    @audiovisuais = Audiovisuai.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @audiovisuais }
    end
  end

  # GET /audiovisuais/1
  # GET /audiovisuais/1.xml
  def show
    @audiovisuai = Audiovisuai.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @audiovisuai }
    end
  end

  # GET /audiovisuais/new
  # GET /audiovisuais/new.xml
  def new
    @audiovisuai = Audiovisuai.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @audiovisuai }
    end
  end

  # GET /audiovisuais/1/edit
  def edit
    @audiovisuai = Audiovisuai.find(params[:id])
  end

  # POST /audiovisuais
  # POST /audiovisuais.xml
  def create
    @audiovisuai = Audiovisuai.new(params[:audiovisuai])

    respond_to do |format|
      if @audiovisuai.save
        flash[:notice] = 'Audiovisuai was successfully created.'
        format.html { redirect_to(@audiovisuai) }
        format.xml  { render :xml => @audiovisuai, :status => :created, :location => @audiovisuai }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @audiovisuai.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /audiovisuais/1
  # PUT /audiovisuais/1.xml
  def update
    @audiovisuai = Audiovisuai.find(params[:id])

    respond_to do |format|
      if @audiovisuai.update_attributes(params[:audiovisuai])
        flash[:notice] = 'Audiovisuai was successfully updated.'
        format.html { redirect_to(@audiovisuai) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @audiovisuai.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /audiovisuais/1
  # DELETE /audiovisuais/1.xml
  def destroy
    @audiovisuai = Audiovisuai.find(params[:id])
    @audiovisuai.destroy

    respond_to do |format|
      format.html { redirect_to(audiovisuais_url) }
      format.xml  { head :ok }
    end
  end
end
