class CompaniesController < ApplicationController
    before_action :set_company, only: [:edit, :update, :destroy]

    def index
        @companies = Company.all
    end
    
    def new
        @company = Company.new
    end

    def create
        @company = Company.create(company_params)
        if @company.valid? 
            redirect_to companies_path, notice: 'company created, all is good!'
        else 
            render 'new', status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @company.update(company_params) 
            redirect_to companies_path
        else
            render 'edit', status: :unprocessable_entity
        end
    end

    def destroy
        @company.destroy
        redirect_to companies_path
    end

    private

    def set_company
        @company = Company.find(params[:id])
    end

    def company_params
        params.require(:company).permit(:name)
    end
end