class Product < ActiveRecord::Base
  include ::RailsShop::StatesProcessing
  include ::RailsShop::ContentProcessing
  include ::RailsShop::ShopCategoryItemConsistency

  include ::SimpleSort::Base
  include ::Pagination::Base
  include ::HasMetaData::Holder
  include ::TheStorages::Storage
  include ::AttachedImages::ItemModel
  include ::Notifications::LocalizedErrors

  include ::TheCommentsBase::Commentable

  paginates_per 24

  # VALIDATIONS

  validates_presence_of :user, :title
  validates_presence_of :slug, if: ->{ errors.blank? }
  validates :sku, uniqueness: true, if: ->{ sku.present? }

  include ::FriendlyIdPack::Base

  include ::RailsShop::ProductParamsCardMethods
  include ::RailsShop::ProductSearchMethods
  include ::RailsShop::ProductPriceMethods
  include ::RailsShop::ProductHasOrNeed

  # RELATIONS

  belongs_to :user

  belongs_to :shop_params_card, polymorphic: true

  has_many :shop_category_rels, as: :item

  has_many :shop_categories,
    through: :shop_category_rels,
    source: :category, source_type: :ShopCategory

  has_many :shop_brands,
    through: :shop_category_rels,
    source: :category, source_type: :ShopBrand

  has_many :shop_colors,
    through: :shop_category_rels,
    source: :category, source_type: :ShopColor

  has_many :shop_unit_ports,
    through: :shop_category_rels,
    source: :category, source_type: :ShopUnitPort

  # SCOPES
  scope :in_stock, ->{ where('amount > 0') }
end
