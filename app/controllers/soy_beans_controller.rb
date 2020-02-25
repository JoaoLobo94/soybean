# frozen_string_literal: true

# rubocop:disable Metrics/MethodLength
require 'csv'

# defining all the routes method
class SoyBeansController < ApplicationController
  def index
    @all_soy = SoyBean.all
    if params['search'].present?
      columns = SoyBean.column_names.drop(1).take(36)
      @array_hash = []
      columns.each do |val|
        @array_hash << {"#{val}": params['search']["#{val}"]}
      end
      finder = @array_hash.inject(:merge).delete_if { |k, v| v.empty? }
      @all_soy = SoyBean.where(finder)
    end
  end

  def create
    SoyImport.parse(params[:file].path)
    redirect_back(fallback_location: soy_beans_path) 
  end

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
