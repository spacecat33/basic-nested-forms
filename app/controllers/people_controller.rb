class PeopleController < ApplicationController
  def new
    @person = Person.new
    @person.addresses.build(address_type: 'work')
    @person.addresses.build(address_type: 'home')
  end

  def create    
    @person = Person.new(person_params)
    if @person.save
      redirect_to people_path #or redirect to people_path(@person)
    else
      render :new
    end
  end

  def index
    @people = Person.all
  end

  private

  def person_params
    params.require(:person).permit(
      :name,
    :addresses_attributes => [
      :street_address_1,
      :street_address_2,
      :city,
      :state,
      :zipcode,
      :address_type
    ]
  )
  end
end
