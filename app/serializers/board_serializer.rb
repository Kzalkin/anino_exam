class BoardSerializer < ActiveModel::Serializer
  type 'board'

  attributes :id, :name

  has_many :entries

  def entries
    @per_page = @instance_options[:per_page] || 10
    @page = @instance_options[:page].to_i
    @page_num = @page.nonzero? ? (@page - 1) * @per_page : 0
    self.object.entries.order("score DESC").order("created_at ASC").limit(@per_page).offset(@page_num)
  end
end
