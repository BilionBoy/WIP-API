module PagyPagination
  extend ActiveSupport::Concern
  include Pagy::Backend

  def paginate(query, per_page, serializer: nil)
    pagy, records = pagy(query, items: (per_page || 10))

    items =
      if serializer
        ActiveModelSerializers::SerializableResource.new(
          records,
          each_serializer: serializer
        )
      else
        records
      end

    {
      pagy: {
        current_page: pagy.page,
        total_pages:  pagy.pages,
        total_count:  pagy.count,
        per_page:     pagy.items
      },
      items: items
    }
  end
end
