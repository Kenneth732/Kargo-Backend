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
        machine = Machine.find(params[:id])
        old_price = machine.price
        new_price = calculate_new_price(old_price)  # Custom method to calculate the new price
    
        if machine.update(price: new_price)
          # Handle successful update
        else
          # Handle update failure
        end
      end
    
      def destroy
        cart = Cart.find(params[:id])
        if cart.destroy
          # Handle successful deletion
        else
          # Handle deletion failure
        end
      end


    private 

    def machine_params
        params.require(:machine).permit(:name, :price, :image, :category, :description)
    end

    def calculate_new_price(old_price)
        # Perform your calculation logic here based on the old price
        # For example, let's say we want to increase the price by 10%
        increase_percentage = 10
        new_price = old_price + (old_price * increase_percentage / 100)
      
        # Return the new calculated price
        new_price
      end      
end

