class JobsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]   #this controller is for USERS to create/modify listings

  # GET /jobs
  # GET /jobs.xml
  def index
    @user = current_user
    @jobs = Job.where("user_id = ?", @user.id).order('created_at DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @jobs }
    end
  end

  # GET /jobs/1
  # GET /jobs/1.xml
  def show
    @job = Job.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @job }
    end
  end

  # GET /jobs/new
  # GET /jobs/new.xml
  def new
    @job = Job.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @job }
    end
  end

  # GET /jobs/1/edit
  def edit
    #TODO - scope to current user
    @job = Job.find(params[:id])
  end

  # POST /jobs
  # POST /jobs.xml
  def create
    @job = Job.new(params[:job])
    @job.user_id = current_user.id                      #assign the ownership at this level
    @job.disabled = false                               #setting a default value here
    if @job.repost.nil?                                 #figure out when the job should expire from site
      @job.expiration = 3.months.from_now
    else
      @job.expiration = Time.now + @job.repost.week     #grab the repost integer and use it to set expiration
    end

    respond_to do |format|
      if @job.save
        format.html { redirect_to(@job, :notice => 'Job was successfully created.') }
        format.xml  { render :xml => @job, :status => :created, :location => @job }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @job.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /jobs/1
  # PUT /jobs/1.xml
  def update
    #TODO - scope to current user
    @job = Job.find(params[:id])

    respond_to do |format|
      if @job.update_attributes(params[:job])
        format.html { redirect_to(@job, :notice => 'Job was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @job.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.xml
  def destroy
    @job = Job.find(params[:id])
    if @job.user_id == current_user.id
      @job.disabled = true             #not deleting anything
      @job.save
    else
      redirect_to(@job, :notice => 'Job is not owned by you')
    end

    respond_to do |format|
      format.html { redirect_to(jobs_url) }
      format.xml  { head :ok }
    end
  end
end
