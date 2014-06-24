class IndexController < ApplicationController

  def home

  end

  def testpdf
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "testpdf.pdf",
               :layout => 'pdf.html',
               :disposition => 'inline',
               :show_as_html => params[:debug].present?,
               :footer => {
                  :right => '[page] / [topage]',
                  :font_size => 10
                },
                :header => {
                  :left => 'Tutu Du Monde',
                  :font_size => 10
                },
               :orientation => 'Landscape'
      end
    end
  end

end