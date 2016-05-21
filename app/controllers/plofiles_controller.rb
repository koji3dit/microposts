class PlofilesController < ApplicationController
  def new_plofile
    @plofile=Plofile.new
  end
end
