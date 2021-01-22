class MangaJob < ApplicationJob
  queue_as :default

  def perform(id)
    Manga.destroy(id)
  end
end
