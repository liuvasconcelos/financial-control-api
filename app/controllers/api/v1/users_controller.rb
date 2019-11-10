module Api
  module V1
    class UsersController < ApplicationController 
      
      #List all users
      def index
        users = User.order('created_at DESC');
        render json: { status: 'SUCCESS', message: 'Saved users', data: users}, status: :ok
      end

      #Get one user
      def show
        user = User.find(params[:id])
        render json: { status: 'SUCCESS', message: 'Found user', data: user}, status: :ok
      end

      #Create a user
      def create
        user = User.new(user_params)

        if user.save
          render json: {status: 'SUCCESS', message: 'Saved user', data: user}, status: :ok
        else
          render json: {status: 'ERROR', message: 'User not saved', data: user.errors}, status: :unprocessable_entity
        end
      end
      
      #Destroy a user
      def destroy
        user = User.find(params[:id])
        user.destroy
        render json: {status: 'SUCCESS', message: 'Deleted user', data: user}, status: :ok
      end

      #Update a user
      def update
        user = User.find(params[:id])

        if user.update_attributes(user_params) 
          render json: {status: 'SUCCESS', message: 'User updated', data: user}, status: :ok
        else
          render json: {status: 'ERROR', message: 'User not updated', data: user}, status: :unprocessable_entity
        end
      end

      #Accepted parameters
      private
      def user_params
        params.permit(:name, :email, :password)
      end
    end
  end
end

