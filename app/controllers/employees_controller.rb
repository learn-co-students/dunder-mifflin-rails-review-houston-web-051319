class EmployeesController < ApplicationController
    protect_from_forgery
     def index
        @employees = Employee.all
     end

     def show 
        @employee = Employee.find(params[:id])
     end

     def create
  
        @employee=Employee.create(employee_params[:employee])
        redirect_to employee_path(@employee.id)
        
     end

     def edit

        @employee = Employee.find(params[:id])

     end

     def update
         @employee = Employee.find(params[:id])
         @employee.update(employee_params[:employee])
         redirect_to employee_path(@employee.id)
     end

         



     


     def employee_params
        params.permit(
            employee: [
                :first_name,
                :last_name,
                :office,
                :img_url,
                :dog_id,
                :title,
                :alias

            ]
            
        )
        end
end
