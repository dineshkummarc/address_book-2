module ActsAsFerret
  module ClassMethods
    def paginate_search(query, options = {}, find_options = {})
      page     = options[:page] || 1
      per_page = options[:per_page] || 10
      total    = options[:total_entries]
      
      pager = WillPaginate::Collection.new(page, per_page, total)
      options.merge!(:offset => pager.offset, :limit => per_page)
      result = find_with_ferret(query, options, find_options)
      returning WillPaginate::Collection.new(page, per_page, result.total_hits) do |p|
        p.replace result
      end
    end
  end
end