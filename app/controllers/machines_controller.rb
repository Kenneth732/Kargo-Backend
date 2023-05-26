class MachinesController < ApplicationController

    def index
        machines = Machine.all 
        render json machines 
    end

    def show
        machine = Machine.find(params[:id])
        render json: machine 
    end

    def create
        machine = Machine.create(machine_params)
        render json: status: :created
    end

    def update 
    end

    def destroy
    end


    private 

    def machine_params
        params.require(:machine).permit(:name, :price, :image, :category, :description)
    end
end

