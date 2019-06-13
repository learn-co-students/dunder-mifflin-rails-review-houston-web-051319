class EmployeesController < ApplicationController
    
    def index
        @employees = Employee.all
    end

    def new
        @dogs = Dog.all
        @errors = error_check
    end

    def create
        employee = Employee.new(allowed_params)
        if (employee.valid?)
            employee.save
            redirect_to employee_path(employee)
        else
            flash[:errors] = employee.errors.messages
            redirect_to new_employee_path
        end
    end

    def show
        @employee = Employee.find(params[:id])
    end

    def edit
        @dogs = Dog.all
        @employee = Employee.find(params[:id])
        @errors = error_check
    end

    def update
        employee = Employee.find(params[:id])
        employee.assign_attributes(allowed_params)
        if (employee.valid?)
            employee.save
            redirect_to employee_path(employee)
        else
            flash[:errors] = employee.errors.messages
            redirect_to edit_employee_path(employee)
        end
    end

    private

    def error_check
        if (flash[:errors])
            flash[:errors]
        else
            {}
        end
    end

    def allowed_params
        params.required(:employee).permit(
            :first_name,
            :last_name,
            :alias,
            :title,
            :office,
            :img_url,
            :dog_id
        )
    end

end
