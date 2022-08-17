class Public::ReportsController < ApplicationController
  def create
    @report = Report.new(report_params)
    @report.save
    flash[:success] = '通報しました'
    redirect_back(fallback_location: public_path)
  end

  private

  def report_params
    params.require(:report).permit(:genre,:address,:status)
  end

end
