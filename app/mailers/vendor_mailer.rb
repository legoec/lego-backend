class VendorMailer < ApplicationMailer
  default from: 'Lego App <noreply@legoapp.com>'

  def vendor_accepted
    @vendor = params[:vendor]
    mail(to: @vendor.user.email, subject: "Tu solicitud ha sido aprobada.")
  end

  def vendor_recomendation
    @vendor = params[:vendor]
    @recomendation = params[:recomendation]
    mail(to: @vendor.user.email, subject: "Has recibido una revisión.")
  end

end
