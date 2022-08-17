class Public::ReportsController < ApplicationController
  def create
    @report = Report.new
    @report.save(report_params)
    redirect_to :back, success: "報告が完了しました"
  end

  private

  def report_params
    params.require(:report).permit(:genre,:address,:status)
  end

end
