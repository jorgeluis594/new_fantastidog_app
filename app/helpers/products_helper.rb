module ProductsHelper
  def can_update_product?
    return '' unless @product.persisted?
    current_page?(edit_product_path @product) ? "edit-button" : ''
  end

  def print_product_id
    @product.id or ''
  end
end
