class Admin < ActiveRecord::Base
	has_ancestry
	#searchkick
	default_scope { order({name: :asc}, :salary )}
	  #scope :admin, order('total_salary DESC')
	  #Admin.order(:total_salary => :desc)
	#def self.filter(filter)
    #if filter
      #where(id: filter)
    #end
  #end
end
