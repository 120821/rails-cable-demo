class FortunesController < ApplicationController
  before_action :set_fortune, only: [:show, :edit, :update, :destroy]

  def index
    @fortunes = Fortune.all
    @total_count = @fortunes.all.size
    @fortunes = @fortunes.where('name like ?', "%#{params[:fortune_name]}%") if params[:fortune_name].present?
    @fortunes = @fortunes.where('type_id = ?', params[:fortune_type_id]) if params[:fortune_type_id].present?
    @mounts = @fortunes.where('year = ?', 2021).order('industry desc').limit(15)
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
      china_fortune = Fortune.new
      if row['Asset'].present?
        china_fortune.company = row['Company']
        china_fortune.revenue = row['Revenue']
        china_fortune.profit = row['Profit']
        china_fortune.asset = row['Asset']
        china_fortune.equity = row['Equity']
        china_fortune.country = row['Country']
        china_fortune.industry = row['Industry']
        china_fortune.employee = row['Employee']
        china_fortune.save!
      end
    end
    redirect_to fortunes_url, notice: '操作成功'
  end
  private
  def set_fortune
    @fortune = Fortune.find(params[:id])
  end

  def fortune_params
    params.require(:fortune).permit(:company, :revenue, :profit, :asset, :equity, :per_capita_profit, :year, :country, :industry, :employee)
    params.require(:china_fortune).permit(:company, :revenue, :profit, :asset, :equity, :per_capita_profit, :year, :country, :industry, :employee)
  end
end
