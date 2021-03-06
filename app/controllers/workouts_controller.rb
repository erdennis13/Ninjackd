class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update, :destroy, :assign]

  def index
    @workouts = Workout.all.where(active: true).order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    @workoutCategories = ["",]
    @workouts.each do |add|
      unless @workoutCategories.include?(add.category)
         @workoutCategories << add.category
      end
      #@workoutCategories.append(add.category)
    end
    @workouts = @workouts.cat(params[:cat]) if params[:cat].present?
    @workouts = @workouts.starts_with(params[:starts_with]) if params[:starts_with].present?
    @workouts = @workouts.duration_lt(params[:less_than]) if params[:less_than].present?
    @workouts = @workouts.search(params[:search]) if params[:search].present?
    @user = current_user
    @weeklyplans = Weeklyplan.where(active: true, usercreate: nil)
    @userplans = Weeklyplan.where(usercreate: current_user)
  end

  def admin
    @workouts = Workout.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 20)
    @users = User.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 20)
    if Rails.env == 'production'
      user_num = [1,3,6]
    else
      user_num = 1
    end
    @weeklyplans = Weeklyplan.where(usercreate: user_num).order("created_at DESC").paginate(:page => params[:page], :per_page => 20)
    @user = User.new
    @dailytips = Dailytip.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 20)
    @dailytip = Dailytip.new
    @userreviews = Userreview.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 20)
  end

  def add_daily_tip
    @dailytip = Dailytip.new
    dailytip = params['dailytip']
    d = Date.parse(dailytip[:show_date])
    @dailytip.user_id = dailytip[:user_id]
    @dailytip.tip = dailytip[:tip]
    #@dailytip.show_date = d.strftime('%Y/%d/%m')
    @dailytip.show_date = Date.parse(dailytip[:show_date]).strftime('%Y/%m/%d')
    #@dailytip.show_date = Date.new(dailytip["show_date(3i)"].to_i, dailytip["show_date(2i)"].to_i, dailytip["show_date(1i)"].to_i)
    if @dailytip.save
      redirect_to admin_path
      flash[:notice] =  "NinjaTip has been added for #{@dailytip.show_date}"
    else
      redirect_to admin_path
      flash[:notice] = "NinjaTip was unable to save"
    end 
  end

  def add_new_user
    @newuser = User.new
    @newuser.name = params["user"][:name]
    @newuser.username = params["user"][:username]
    @newuser.password = params["user"][:password]
    @newuser.admin = params["user"][:admin]
    @newuser.email = params["user"][:email]
    @newuser.paypal_payment_token = params["user"][:paypal_payment_token]

    if @newuser.save
      redirect_to admin_path
      flash[:notice] = "#{@newuser.name} has been added to the users"
    else
      redirect_to admin_path 
      flash[:notice] = "User unable to be saved"
    end
  end

  def show
    @exerciseOptions = Exercise.all
    @exerciseidoptions = []
    @exerciseOptions.each do |add|
      @exerciseidoptions.append(add)
    end

    @warmupoptions = Warmup.all
    @warmupidoptions = []
    @warmupoptions.each do |add|
      @warmupidoptions.append(add)
    end

    @warmups = @workout.warmworks.all
    @comments= @workout.comments.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)

  end

  def add_weekly_subscription
    weeklyplan = Weeklyplan.find(params[:weeklyplan_id])
    @date = Date.today.beginning_of_week(:sunday)
    @user = current_user.id
    dates = Hash.new
    dates[1] = @date
    dates[2] = @date + 1
    dates[3] = @date + 2
    dates[4] = @date + 3
    dates[5] = @date + 4
    dates[6] = @date + 5
    dates[7] = @date + 6
    @weeklyplan = weeklyplan
    @dayinc = 1
    7.times do
      @weeklyplan.weeklybits.each do |check|
        unless dates[check.day] < Date.today
          if check.day == @dayinc
            @sub = Subscription.new
            @sub.user_id = @user
            @sub.workout_id = check.workout.id
            @sub.schedule = dates[check.day]
            @sub.save
          end
        end
      end
      @dayinc += 1
    end
    weeklyplan.hits += 1
    weeklyplan.save
    redirect_to profile_url
    flash[:notice] = 'Weeklyplan was added successfully to your subscriptions. Enjoy!'
  end

  def usercreate
    @alluserplans = Weeklyplan.where(usercreate: current_user.id)
    @coeff = []
    @alluserplans.each do |add|
      num = add.name.split("_").last.to_i
      unless @coeff.include?(num) and num.is_a? Integer
         @coeff << num
      end
    end
    if @coeff.length != 0
      @endcoeff = @coeff.max
    else
      @endcoeff = 0
    end
    @weeklyplan = Weeklyplan.new
    @weeklyplan.usercreate = current_user.id
    @planname = "#{current_user.try(:username)}_weeklyplan_#{@endcoeff + 1}"
    @weeklyplan.name = @planname
    respond_to do |format|
      if @weeklyplan.save
        format.html { redirect_to @weeklyplan, notice: 'Weeklyplan was successfully created.' }
        format.json { render action: 'show', status: :created, location: @weeklyplan }
      else
        format.html { redirect_to :back, notice: 'Weeklyplan was unsuccessfully created.' }
        format.json { render action: 'show', status: :created, location: @weeklyplan }
      end
    end
  end

  def new
    @workout = Workout.new
    @workoutbits = @workout.workoutbits.build
    @exercise = @workoutbits.build_exercise
    @facilityOptions = ["","yes", "no"]

    @warmupoptions = Warmup.all
    @warmupidoptions = []
    @warmupoptions.each do |add|
      @warmupidoptions.append(add.id)
    end
  end
  
  def edit
    @facilityOptions = ["","yes", "no"]
  end

  def create
    @workout = Workout.new(workout_params)
    respond_to do |format|
      if @workout.save
        format.html { redirect_to @workout, notice: 'Workout was successfully created.' }
        format.json { render action: 'show', status: :created, location: @workout }
      else
        format.html { redirect_to @workout, notice: 'Workout was unsuccessfully created.' }
        format.json { render action: 'show', status: :created, location: @workout }
      end
    end
  end

  def update
    @workout.update(workout_params)
    respond_to do |format|
      if @workout.save
        format.html { redirect_to @workout, notice: 'Workout was successfully updated.' }
        format.json { render action: 'show', status: :created, location: @workout }
      else
        format.html { redirect_to edit_workout_path(@workout), notice: 'Workout was unsuccessfully updated.' }
        format.json { render action: 'show', status: :created, location: @workout }
      end
    end
  end


  def destroy
    @workout.destroy
    respond_to do |format|
      format.html { redirect_to workouts_url }
      format.json { head :no_content }
    end
  end

  private
    def set_workout
      @workout = Workout.find(params[:id])
    end

    def workout_params
      #params.require(:workout).permit(:name, :category, :description, :duration)
      params.require(:workout).permit(:name, :category, :description, :duration, :weightFacility, :note, :active ,workoutbits_attributes: [ :id, :sets, :reps, exercise_attributes: [:id]])
    end

end
