class RegistrationsController < ApplicationController
  # GET /registrations
  # GET /registrations.xml
  def index
    @registrations = Registration.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @registrations }
    end
  end

  # GET /registrations/1
  # GET /registrations/1.xml
  def show
    @registration = Registration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @registration }
    end
  end

  # GET /registrations/new
  # GET /registrations/new.xml
  def new
    @registration = Registration.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @registration }
    end
  end

  # GET /registrations/1/edit
  def edit
    @registration = Registration.find(params[:id])
  end

  # POST /registrations
  # POST /registrations.xml
  def create
    @registration = Registration.new(params[:registration])
    source = params[:source] || ''
    respond_to do |format|
      begin
        if @registration.save
          flash[:notice] = 'Registration was successfully created.'
          format.html {
            if (source) == 'gmclassof65.org'
              RegistrationMailer.send_later(:deliver_registration_received_message, @registration)
              UserMailer.send_later(:deliver_registration_received_message, @registration)
              redirect_to :controller=>"/gm65", :action =>"thanks" and return
            else
              redirect_to(@registration)
            end
            }
          format.xml  { render :xml => @registration, :status => :created, :location => @registration }
        else
          flash[:notice] = 'There was an error creating the registration.'
          format.html {
            if (source) == 'gmclassof65.org'
              error_msgs = @registration.errors.full_messages
              redirect_to :controller=>"/gm65", :action =>"reg_error", :params => { :errors=>error_msgs  } and return
            else
              render :action => "new"
            end
            }
          format.xml  { render :xml => @registration.errors, :status => :unprocessable_entity }
        end
      rescue Exception => e
        flash[:notice] = 'There was an error creating the registration.'
        format.html {
          if (source) == 'gmclassof65.org'
            redirect_to :controller=>"/gm65", :action =>"reg_error", :params => { :errors=>e.message }  and return
          else
            render :action => "new"
          end
          }
        format.xml  { render :xml => @registration.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /registrations/1
  # PUT /registrations/1.xml
  def update
    @registration = Registration.find(params[:id])

    respond_to do |format|
      if @registration.update_attributes(params[:registration])
        flash[:notice] = 'Registration was successfully updated.'
        format.html { redirect_to(@registration) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @registration.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /registrations/1
  # DELETE /registrations/1.xml
  def destroy
    @registration = Registration.find(params[:id])
    @registration.destroy

    respond_to do |format|
      format.html { redirect_to(registrations_url) }
      format.xml  { head :ok }
    end
  end
end
