class MailerController < ApplicationController
  def contact
    property = Property.find(params[:id])
    # TODO: Change to ajax and return a bubble
    response = UserMailer.with(user: contact_params, property: property).contact_email.deliver_now
    if response.deliver
        redirect_to property_path(property.id), notice: "Mensaje enviado satisfactoriamente."
    else
        redirect_to property_path(property.id), notice: "Ocurrio un error al enviar su mensaje  ."
    end
  end
  
  def contact_params
    params.permit(:fullname, :phone, :email, :message, :id)
  end
end
