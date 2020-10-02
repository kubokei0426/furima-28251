class ExhibitionsController < ApplicationController
  def index
  end
  def new
    @exhibitions = Exhibition.new
  end
end