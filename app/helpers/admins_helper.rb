module AdminsHelper
	 def total_salary(adm)
		tot = adm.salary.to_i
		d1 = adm.number_of_days.to_i

		total_amount = tot * d1
		return total_amount

	end

	

    
    
  
end
