module Layout::AccountHelper
  def roles
    [
      ['Người dùng', 'member'],
      ['Người đăng bài', 'creator'],
      ['Người kiểm duyệt', 'reviewer']
    ]
  end
end
