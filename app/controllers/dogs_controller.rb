class DogsController < ApplicationController

    def index
        if session[:sort] == 1
            all_dogs = Dog.all
            sorted_dogs = all_dogs.sort_by do |dog|
                dog.employees.count
            end
            @dogs = sorted_dogs.reverse
            @sort = 1
        else
            @dogs = Dog.all
            @sort = 2
        end    
    end

    def sorted_index
        if params[:sort] == "1"
            session[:sort] = 1
        else
            session[:sort] = 2
        end
        redirect_to dogs_path
    end

    def show
        @dog = Dog.find(params[:id])
    end

end
