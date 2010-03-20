class ClassMembersController < ApplicationController
  # GET /class_members
  # GET /class_members.xml
  def index
    @class_members = ClassMember.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @class_members }
    end
  end

  # GET /class_members/1
  # GET /class_members/1.xml
  def show
    @class_member = ClassMember.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @class_member }
    end
  end

  # GET /class_members/new
  # GET /class_members/new.xml
  def new
    @class_member = ClassMember.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @class_member }
    end
  end

  # GET /class_members/1/edit
  def edit
    @class_member = ClassMember.find(params[:id])
  end

  # POST /class_members
  # POST /class_members.xml
  def create
    @class_member = ClassMember.new(params[:class_member])

    respond_to do |format|
      if @class_member.save
        flash[:notice] = 'ClassMember was successfully created.'
        format.html { redirect_to(@class_member) }
        format.xml  { render :xml => @class_member, :status => :created, :location => @class_member }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @class_member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /class_members/1
  # PUT /class_members/1.xml
  def update
    @class_member = ClassMember.find(params[:id])

    respond_to do |format|
      if @class_member.update_attributes(params[:class_member])
        flash[:notice] = 'ClassMember was successfully updated.'
        format.html { redirect_to(@class_member) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @class_member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /class_members/1
  # DELETE /class_members/1.xml
  def destroy
    @class_member = ClassMember.find(params[:id])
    @class_member.destroy

    respond_to do |format|
      format.html { redirect_to(class_members_url) }
      format.xml  { head :ok }
    end
  end
end
