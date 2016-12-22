class AdminsController < ApplicationController
    before_action :set_admin, only: [:show, :edit, :update, :destroy,:report]
    before_filter :filter 
    #before_filter :authorize, :except => [:index, :show]

	def index
	#if params[:admin]
       #@admins = Admin.filter(params[:admin][:name])
    #else
    @admins = Admin.all
    #end


	end

	def show
	end
    
    def create
    	@admin = Admin.new(admin_params)

    respond_to do |format|
      if @admin.save
        format.html { redirect_to admins_path, notice: 'Admin was successfully created.' }
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
    end

    #def total_salary
    #total_salary
    # .order(Total_salary.arel_table['created_at'].desc)
    # .first
    #end
    

    def generate_file
      @admins = Admin.all
       render :pdf => "invoices"
    end

    def report
		render pdf: "PDF_#{@admin.name}"
	end

	def destroy
	   @admin.destroy
      respond_to do |format|
      format.html { redirect_to admins_url, notice: 'Admin was successfully destroyed.' }
      format.json { head :no_content }
    end
	end

	def edit
	end

	def update
		respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to admins_path, notice: 'admin was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render :edit }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
	end



	def new
	  	@admin = Admin.new(:parent_id => params[:parent_id])
	end

	def upload_file
		@admin = Admin.create(admin_params)
	end

	def tree
		# result = {}
		# node = Model.first
		# # fac = rec(5)
		# cal_rec(node , result)
			
		# render :json => result
	end 

	def total_amount
		#result=salary/number_of_days*total_days_in_a_month
		#@result=current_admin.total_salary
	end


	def downline
		@downline = current_admin.children
		@tree = [{
      	'name': 'gayatri',
      	'parent': 'null',
      	'children': [
	        {
	          'name': 'Level 2: harry',
	          'parent': 'Top Level',
	          'children': [
	            {
	              'name': 'Son of A',
	              'parent': 'Level 2: A',
		      'children': [
			    {
			      'name': 'tinuky',
			      'parent': 'Son of A'
			    },
			    {
			      'name': 'Joni',
			      'parent': 'Son of A'
			    },
			    {
			      'name': 'tinuky',
			      'parent': 'Son of A'
			    },
			    {
			      'name': 'Joni',
			      'parent': 'Son of A'
			    },
			    {
			      'name': 'tinuky',
			      'parent': 'Son of A'
			    },
			    {
			      'name': 'Joni',
			      'parent': 'Son of A'
			    }
	 		]	
	            },
	            {
	              'name': 'Daughter of A',
	              'parent': 'Level 2: A'
	            }
	          ]
	        },
	        {
	          'name': 'Level 2: B',
	          'parent': 'Top Level'
	        }
        ]
    }
  ]
  end

    #def search
    	#@search_admins = Admin.search(params[:search])
    #end
	

	private 

	def filter
      
    end

	def set_admin
      @admin = Admin.find(params[:id])
    end


	def admin_params
		params.require(:admin).permit(:id, :avatar, :name, :salary, :From_date, :todate, :number_of_days, :leave, :total_salary)
	end
end