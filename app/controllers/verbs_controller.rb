class VerbsController < ApplicationController

  def all
    render json: ::Verbs::Autocomplete.perform(params[:query])
  end
end
