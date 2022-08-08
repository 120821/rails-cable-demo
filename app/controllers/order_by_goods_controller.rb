class OrderByGoodsController < ApplicationController
  before_action :set_order_by_good, only: [:show, :edit, :update, :destroy]

  def index
    @order_by_goods = OrderByGood.all
    @total_count = @order_by_goods.all.size
    @order_by_goods = @order_by_goods.order('id desc').page(params[:page]).per(100)
  end

  # GET /order_by_goods/1
  # GET /order_by_goods/1.json
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
      order_by_good = OrderByGood.new
      if row['金额'].present?
        order_by_good.order_id = row['订单ID']
        order_by_good.user_name_id = row['用户ID']
        order_by_good.country = row['国家']
        order_by_good.province = row['省份']
        order_by_good.district = row['区县']
        order_by_good.sum = row['金额']
        order_by_good.save!
      end
    end
    redirect_to  order_by_goods_url, notice: '操作成功'
  end

  # GET /order_by_goods/new
  def new
    @order_by_good = OrderByGood.new
  end

  # GET /order_by_goods/1/edit
  def edit
  end

  # POST /order_by_goods
  # POST /order_by_goods.json
  def create
    @order_by_good = OrderByGood.new(order_by_good_params)

    respond_to do |format|
      if @order_by_good.save
        format.html { redirect_to @order_by_good, notice: '操作成功' }
        format.json { render :show, status: :created, location: @order_by_good }
      else
        format.html { render :new }
        format.json { render json: @order_by_good.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_by_goods/1
  # PATCH/PUT /order_by_goods/1.json
  def update
    respond_to do |format|
      if @order_by_good.update(order_by_good_params)
        format.html { redirect_to @order_by_good, notice: '操作成功' }
        format.json { render :show, status: :ok, location: @order_by_good }
      else
        format.html { render :edit }
        format.json { render json: @order_by_good.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_by_goods/1
  # DELETE /order_by_goods/1.json
  def destroy
    @order_by_good.destroy
    respond_to do |format|
      format.html { redirect_to order_by_goods_url, notice: '操作成功' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_by_good
      @order_by_good = OrderByGood.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_by_good_params
      params.require(:order_by_good).permit(:country, :user_name_id, :province, :city, :district, :sum, :order_id)
    end
end
