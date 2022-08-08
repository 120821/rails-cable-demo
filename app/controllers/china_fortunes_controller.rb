class ChinaFortunesController < ApplicationController
  before_action :set_china_fortune, only: [:show, :edit, :update, :destroy]

  def index
    @china_fortunes = ChinaFortune.all
    @china_fortunes = @china_fortunes.page(params[:page]).per(100)
    @total_count = @china_fortunes.all.size
    @mounts = @china_fortunes.where('year = ?', 2020).order('company desc').limit(15)
    @per2021_capita = @china_fortunes.where('year = ?', 2021).order('per_capita_profit desc').limit(15)
    @pers = @china_fortunes.where('year = ?', 2018)
    @group_by_2021industry = @china_fortunes.where('year = ?', 2021).group(:industry).count
    @group_by_2020industry = @china_fortunes.where('year = ?', 2020).group(:industry).count
    @group_by_2019industry = @china_fortunes.where('year = ?', 2019).group(:industry).count
    @group_by_2018industry = @china_fortunes.where('year = ?', 2018).group(:industry).count
    @group_by_2017industry = @china_fortunes.where('year = ?', 2017).group(:industry).count

    Rails.logger.info "=====@group_by_2021industry.inspect #{@group_by_2021industry.inspect}"
    Rails.logger.info "=====@group_by_2020industry.inspect #{@group_by_2020industry.inspect}"
    Rails.logger.info "=====@group_by_2019industry.inspect #{@group_by_2019industry.inspect}"
    Rails.logger.info "=====@group_by_2018industry.inspect #{@group_by_2018industry.inspect}"
    Rails.logger.info "=====@group_by_2017industry.inspect #{@group_by_2017industry.inspect}"
    @per_twos = @china_fortunes.where('year = ?', 2021).order('per_two desc').limit(15)

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
      china_fortune = ChinaFortune.new
      if row['Asset'].present?
        china_fortune.company = row['Company']
        china_fortune.year = row['Year']
        china_fortune.revenue = row['Revenue']
        china_fortune.per_capita_profit = row['人均利润']
        china_fortune.per_two = row['人均利润']
        china_fortune.profit = row['Profit']
        china_fortune.asset = row['Asset']
        china_fortune.equity = row['Equity']
        china_fortune.country = row['Country']
        china_fortune.industry = row['Industry']
        china_fortune.employee = row['Employee']
        china_fortune.save!
      end
    end
    redirect_to china_fortunes_url, notice: '操作成功'
  end

  # GET /china_fortunes/1
  # GET /china_fortunes/1.json
  def show
  end

  # GET /china_fortunes/new
  def new
    @china_fortune = ChinaFortune.new
  end

  # GET /china_fortunes/1/edit
  def edit
  end

  # POST /china_fortunes
  # POST /china_fortunes.json
  def create
    @china_fortune = ChinaFortune.new(china_fortune_params)

    respond_to do |format|
      if @china_fortune.save
        format.html { redirect_to @china_fortune, notice: '操作成功' }
        format.json { render :show, status: :created, location: @china_fortune }
      else
        format.html { render :new }
        format.json { render json: @china_fortune.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /china_fortunes/1
  # PATCH/PUT /china_fortunes/1.json
  def update
    respond_to do |format|
      if @china_fortune.update(china_fortune_params)
        format.html { redirect_to @china_fortune, notice: '操作成功' }
        format.json { render :show, status: :ok, location: @china_fortune }
      else
        format.html { render :edit }
        format.json { render json: @china_fortune.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /china_fortunes/1
  # DELETE /china_fortunes/1.json
  def destroy
    @china_fortune.destroy
    respond_to do |format|
      format.html { redirect_to china_fortunes_url, notice: '操作成功' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_china_fortune
      @china_fortune = ChinaFortune.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def china_fortune_params
      params.require(:china_fortune).permit(:per_two, :company, :revenue, :profit, :asset, :equity, :per_capita_profit, :year, :country, :industry, :employee)
    end
end
