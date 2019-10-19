json.user do
  json.id current_user.id
  json.name current_user.name
  json.email current_user.email
  json.bookmarks do
    json.array! @bookmarkedtests, partial: "test", as: :test
  end
end
