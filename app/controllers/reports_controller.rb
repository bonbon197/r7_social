class ReportsController < ApplicationController
  before_action :set_report, only: %i[ show edit update destroy singlereport ]
  before_action :authenticate_user!, except: [ :index, :show ]

  # GET /reports or /reports.json
  def index
    Time.zone = 'Asia/Manila'
    @reports = Report.all
  end

  def download
    Time.zone = 'Asia/Manila'
    @reports = Report.all

    pdf = Prawn::Document.new
    pdf.text 'Hello World'
    send_data(pdf.render,
    filename:'report.pdf',
    type: 'application/pdf'
    )
  end

  def preview
    Time.zone = 'Asia/Manila'
    @reports = Report.all

    pdf = Prawn::Document.new
    pdf.text 'This is preview'
    send_data(pdf.render,
    filename:'report.pdf',
    type: 'application/pdf',
    disposition: 'inline'
    )
  end

  def singlereport
    Time.zone = 'Asia/Manila'
    pdf = Prawn::Document.new
    # pdf.text @report.date
    pdf.text @report.title, size:30, style: :bold
    pdf.text @report.content

    # report_image = @report.images 
    # images_print = StringIO.open(report_image.download)
    # pdf.image images_print, fit: [100,100]

    send_data(pdf.render,
    filename:'#{@report.title}.pdf',
    type: 'application/pdf',
    disposition: 'inline')
  end

  # GET /reports/1 or /reports/1.json
  def show
    # respond_to do |format|
    #   format.html
    #   format.pdf do
    #     render pdf: "report", template: "reports/show.html.erb"   # Excluding ".pdf" extension.
    #   end
    # end
  end

  # GET /reports/new
  def new

    @report = Report.new
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports or /reports.json
  def create
    @report = Report.new(report_params)

    respond_to do |format|
      if @report.save
        format.html { redirect_to report_url(@report), notice: "Report was successfully created." }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reports/1 or /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to report_url(@report), notice: "Report was successfully updated." }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1 or /reports/1.json
  def destroy
    @report.destroy!

    respond_to do |format|
      format.html { redirect_to reports_url, notice: "Report was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def remove_image
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge_later
    redirect_back(fallback_location: request.referer)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def report_params
      params.require(:report).permit(:title, :content, :date, :emp_transid, :report_type, :office, :user_id, :remarks, images: [])
    end
end
