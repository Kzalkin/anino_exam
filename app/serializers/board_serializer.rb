class BoardSerializer < ActiveModel::Serializer
  type 'board'

  attributes :id, :name

  has_many :entries

  def entries
    @per_page = @instance_options[:per_page] || 10
    @page = @instance_options[:page].to_i
    @page_num = @page.nonzero? ? (@page - 1) * @per_page : 0
    self.object.entries.paginate(@per_page, @page_num)
  end
end
