module Layout::TourHelper

  def banner_status
    [
      ['Không hiển thị', 0],
      ['Hiển thị EN', 1],
      ['Hiển thị VN', 2]
    ]
  end

  def category_tour
    [
      ['Tin mới nhất','news'],
      ['Vietnam Central','vietnam central'],
      ['Vietnam South','vietnam south'],
      ['Grand Vietnam','grand vietnam'],
      ['Tour Thái Lan','thailan'],
      ['Tour Lào','lao'],
      ['Tour Campuchia','cam'],
      ['Tour Singapore','sing'],
      ['Tour Mã Lai','malai'],
      ['Tour Indonesia','indo']
    ]
  end

  def highlight_tour
    [
      ['Không hiển thị', 0],
      ['Hiển thị', 1]
    ]
  end

  def status_page_info
    [
      ['Tiếng Việt', 0],
      ['Tiếng Anh', 1]
    ]
  end
end
