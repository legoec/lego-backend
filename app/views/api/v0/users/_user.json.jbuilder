json.extract! @user, :id, :name, :nickname, :email
json.image @user.image_url || ''
