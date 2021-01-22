class TomeJob < ApplicationJob
  queue_as :default

  def perform(manga, current_user)
    @tome1 = Tome.new
    @tome1.title = "First Tome"
    @tome1.description = "It is a cool tome"
    @tome1.number = 1
    @tome1.manga = manga
    @tome1.user = current_user
    @tome1.save

    @tome2 = Tome.new
    @tome2.title = "Second Tome"
    @tome2.description = "It is a bad tome"
    @tome2.number = 1
    @tome2.manga = manga
    @tome2.user = current_user
    @tome2.save
  end
end
