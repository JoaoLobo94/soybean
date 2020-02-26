# frozen_string_literal: true

# rubocop:disable Metrics/MethodLength
require 'csv'

# defining all the routes method
class SoyBeansController < ApplicationController
  def index
    @all_soy = SoyBean.all
    return if params['search'].nil?

    columns = SoyBean.column_names.drop(1).take(36)
    @array_of_params = []
    columns.each do |val|
      @array_of_params << {"#{val}": params['search'][val.to_s]}
    end
    finder = @array_of_params.inject(:merge).delete_if { |k, v| v.empty? }
    @all_soy = SoyBean.where(finder)
  end

  def create
    @file = SoyImport.parse(params[:file]&.path)

    if @file&.errors&.any? || @file.nil?
      return redirect_back(fallback_location: soy_beans_path)
    end

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
