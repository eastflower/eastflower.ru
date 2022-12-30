class MetaDatumController < ApplicationController
  before_action :user_require,   except: %w[ ]

  before_action :set_meta_datum, only: %w[ update ]

  before_action :owner_required, except: %w[ ]
  before_action :admin_require,  except: %w[ ]

  def update
    @meta_datum.assign_attributes(mata_data_params)

    if @meta_datum.save
      redirect_to :back, notice: "SEO параметры обновлены"
    else
      redirect_to :back, alert: "Не удалось обновить SEO параметры"
    end
  end

  def set_meta_datum
    @meta_datum = MetaDatum.find(params[:id])
    @owner_check_object = @meta_datum
  end

  private

  def mata_data_params
    params.require(:meta_datum).permit(%w[
      title
      keywords
      description
      author

      og_title
      og_description

      og_url
      og_type
      og_image
      og_site_name
    ])
  end
end