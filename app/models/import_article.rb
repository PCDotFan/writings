class ImportArticle < ActiveRecord::Base
  belongs_to :import_task

  def import
    import_task.space.articles.create(
      :title        => title,
      :body         => body,
      :urlname      => urlname.parameterize,
      :status       => status,
      :created_at   => created_at,
      :published_at => published_at,
      :user         => import_task.user
    )
  end
end
