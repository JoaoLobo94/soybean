# frozen_string_literal: true

# rubocop:disable Metrics/ClassLength
# rubocop:disable Metrics/MethodLength
require 'csv'
require 'soy_import'
# defining all the routes method
class SoyBeansController < ApplicationController
  def index
    soy = PortReducer.apply(params)
    if ports == []
      ports = Port.all
      render json: { status: 'SUCCESS',
                     message: 'No port query detected, or no ports matching your query were found. Displaying all
                     ports in the database', data: ports },
             status: :ok
    else
      render json: { status: 'SUCCESS', message: 'Loaded Ports', data: ports }, status: :ok
    end
  end



 # def create(file)
 # //  SoyImport.parse(file)
# // end

  private

  def soy_beans_params
    params.permit(:classification,
                  :date,
                  :plant_stand,
                  :precip,
                  :temp,
                  :hail,
                  :crop_hist,
                  :area_damaged,
                  :severity,
                  :seed_tmt,
                  :germination,
                  :plant_growth,
                  :leaves,
                  :leafspots_halo,
                  :leafspots_marg,
                  :leafspot_size,
                  :leaf_shread,
                  :leaf_malf,
                  :leaf_mild,
                  :stem,
                  :lodging,
                  :stem_cankers,
                  :canker_lesion,
                  :fruiting_bodies,
                  :external_decay,
                  :mycelium,
                  :int_discolor,
                  :sclerotia,
                  :fruit_spots,
                  :mold_growth,
                  :seed_size,
                  :shriveling,
                  :roots)
  end
  # rubocop:enable
end
