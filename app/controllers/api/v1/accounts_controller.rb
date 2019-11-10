module Api
  module V1
    class AccountsController < ApplicationController 
      
      #List all accounts
      def index
        accounts = Account.order('expire_date ASC');
        render json: { status: 'SUCCESS', message: 'Saved accounts', data: accounts}, status: :ok
      end

      #Get one account
      def show
        account = Account.find(params[:id])
        render json: { status: 'SUCCESS', message: 'Found account', data: account}, status: :ok
      end

      #Create a account
      def create
        account = Account.new(account_params)

        if account.save
          render json: {status: 'SUCCESS', message: 'Saved account', data: account}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Account not saved', data: account.errors}, status: :unprocessable_entity
        end
      end
      
      #Destroy a account
      def destroy
        account = Account.find(params[:id])
        account.destroy
        render json: {status: 'SUCCESS', message: 'Deleted account', data: account}, status: :ok
      end

      #Update a account
      def update
        account = Account.find(params[:id])

        if account.update_attributes(account_params) 
          render json: {status: 'SUCCESS', message: 'Account updated', data: account}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Account not updated', data: account}, status: :unprocessable_entity
        end
      end

      #Accepted parameters
      private
      def account_params
        params.permit(:title, :value, :expire_date, :category, :status)
      end
    end
  end
end

