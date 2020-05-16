# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(
    name: 'user',
    email: 'user@example.com',
    password: '123456789'
)

User.create(
    name: 'admin',
    email: 'admin@example.com',
    password: '123456789',
    admin: true
)

vendor_user = User.create(
    name: 'vendor',
    email: 'vendor@example.com',
    password: '123456789'
)

category = Category.create(
    name: 'Hogar',
    percentage: '3',
    active: true
)

vendor = Vendor.create(
    ruc: '2222222222',
    economic_activity: 'plomero',
    contributor_type: 'natural',
    legal_representative: 'Perico de los Palotes',
    business_name: 'Plomeros SA',
    image: 'https://image.shutterstock.com/image-vector/friendly-plumber-he-dressed-work-260nw-274858382.jpg',
    logo: '',
    slogan: '',
    mobile: '0992555555',
    active: true,
    user: vendor_user,
    category: category
)

VendorRequest.create(
    status: 'approved',
    feedback: '',
    vendor: vendor
)

service = Service.create(
    name: 'Cambio de tuberías cocina',
    price: 40.00,
    amount: 1,
    vendor: vendor
)

Recomendation.create(
  description: 'Realizó un excelente trabajo',
  user: user,
  service: service,
  ranking: 2
)
