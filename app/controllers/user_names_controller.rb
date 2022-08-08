class UserNamesController < ApplicationController
  before_action :set_user_name, only: [:show, :edit, :update, :destroy]

  def index
    @user_names = UserName
    @total_count = @user_names.all.size
    @user_names = @user_names.order('id desc').page(params[:page]).per(100)
    @user_names = @user_names.where('name like ?', "%#{params[:user_name_name]}%") if params[:user_name_name].present?
    @user_names = @user_names.where('sex = ?', params[:user_name_sex]) if params[:user_name_sex].present?
  end

  # GET /user_names/1
  # GET /user_names/1.json
  def show
  end

  def upload
  end

  def import
    require 'csv'

    tmp = params[:file]
    current_file_name = tmp.original_filename + Time.now.to_i.to_s
    uploaded_file = File.join("public/upload_files", current_file_name)
    File.open(uploaded_file, 'wb') do |f|
      f.write(tmp.read)
    end
    #读取csv文件
    csv_text = File.read(uploaded_file)
    csv = CSV.parse(csv_text,:headers => true)
    csv.each_with_index do |row, index|
      user_name = UserName.new
      if row['用户ID'].present?
        user_name.user_name_id = row['用户ID']
        user_name.name = row['用户姓名']
        user_name.sex = row['性别']
        user_name.save!
      end
    end
    redirect_to user_names_url, notice: '操作成功'
  end

  # GET /user_names/new
  def new
    @user_name = UserName.new
  end

  # GET /user_names/1/edit
  def edit
  end

  # POST /user_names
  # POST /user_names.json
  def create
    @user_name = UserName.new(user_name_params)

    respond_to do |format|
      if @user_name.save
        format.html { redirect_to @user_name, notice: '操作成功' }
        format.json { render :show, status: :created, location: @user_name }
      else
        format.html { render :new }
        format.json { render json: @user_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_names/1
  # PATCH/PUT /user_names/1.json
  def update
    respond_to do |format|
      if @user_name.update(user_name_params)
        format.html { redirect_to @user_name, notice: '操作成功' }
        format.json { render :show, status: :ok, location: @user_name }
      else
        format.html { render :edit }
        format.json { render json: @user_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_names/1
  # DELETE /user_names/1.json
  def destroy
    @user_name.destroy
    respond_to do |format|
      format.html { redirect_to user_names_url, notice: '操作成功' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_name
      @user_name = UserName.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_name_params
      params.require(:user_name).permit(:user_name_id, :name, :sex)
    end
end
