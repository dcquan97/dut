Ransack.configure do |c|
  # Change default search parameter key name.
  # Default key name is :q
  c.search_key = :query
  c.custom_arrows = {
    up_arrow: '<i class="fas fa-sort-up"></i>',
    down_arrow: '<i class="fas fa-sort-down"></i>',
    default_arrow: '<i class="fas fa-sort"></i>'
  }
end
