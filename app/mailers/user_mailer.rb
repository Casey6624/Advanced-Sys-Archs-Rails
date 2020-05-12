class UserMailer < ApplicationMailer
    default from: "caseywaseo@gmail.com"

    def contact_email
        @recipient = "caseywaseo@gmail.com"
        @contact_name = params[:name]
        @contact_email = params[:email]
        @contact_subject = params[:subject]
        @contact_query = params[:query]
        mail(to: @recipient, subject: @contact_subject)
    end
end
