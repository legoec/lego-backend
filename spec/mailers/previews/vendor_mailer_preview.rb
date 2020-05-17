# Preview all emails at http://localhost:3000/rails/mailers/vendor_mailer
class VendorMailerPreview < ActionMailer::Preview

  def vendor_accepted
    @user = User.new(email: 'user@example.com')
    @vendor = Vendor.new(business_name: "Plomeros SA", user: @user)

    VendorMailer.with(vendor: @vendor).vendor_accepted
  end

  def vendor_recomendation
    @user = User.new(email: 'user@example.com')
    @vendor = Vendor.new(business_name: "Plomeros SA", user: @user)
    @recomendation = Recomendation.new(description: 'Todo Ok', ranking: 5)

    VendorMailer.with(vendor: @vendor, recomendation: @recomendation).vendor_recomendation
  end
end
