# coding: utf-8

class NumbersController < ApplicationController
  def index
    @title = "Список телефонных номеров"
    @numbers = Number.paginate(:page => params[:page])
  end

  def show
    @number = Number.find(params[:id])
    @title = "Телефонный номер #{@number.number}"
  end
  
  def new
    @title = "Добавить телефонный номер"
    @number = Number.new
  end

  def create
    @number = Number.new(params[:number])
    if @number.save
      flash[:success] = 'Номер успешно добавлен'
      redirect_to numbers_path
    else
      @title = "Добавление телефонного номера"
      render 'new'
    end
  end

  def edit
    @number = Number.find(params[:id])
    @title = "Редактирование номера"
  end

  def update
    @number = Number.find(params[:id])
    if @number.update_attributes(params[:number])
      flash[:success] = 'Номер обновлен'
      redirect_to edit_number_path(@number)
    else
      @title = "Редактирование номера"
      render 'edit'
    end
  end

  def destroy
    Number.find(params[:id]).destroy
    flash[:success] = 'Номер удален'
    redirect_to numbers_path
  end
end
