# alx-airbnb-database
The AirBnb database

Table User {
  user_id uuid [pk]
  first_name varchar [not null]
  last_name varchar [not null]
  email varchar [unique, not null]
  password_hash varchar [not null]
  phone_number varchar
  role varchar [not null]
  created_at timestamp
}

Table Property {
  property_id uuid [pk]
  host_id uuid [ref: > User.user_id]
  name varchar [not null]
  description text [not null]
  location varchar [not null]
  pricepernight decimal [not null]
  created_at timestamp
  updated_at timestamp
}

Table Booking {
  booking_id uuid [pk]
  property_id uuid [ref: > Property.property_id]
  user_id uuid [ref: > User.user_id]
  start_date date [not null]
  end_date date [not null]
  total_price decimal [not null]
  status varchar [not null]
  created_at timestamp
}

Table Payment {
  payment_id uuid [pk]
  booking_id uuid [ref: > Booking.booking_id]
  amount decimal [not null]
  payment_date timestamp
  payment_method varchar [not null]
}

Table Review {
  review_id uuid [pk]
  property_id uuid [ref: > Property.property_id]
  user_id uuid [ref: > User.user_id]
  rating int [not null]
  comment text [not null]
  created_at timestamp
}

Table Message {
  message_id uuid [pk]
  sender_id uuid [ref: > User.user_id]
  recipient_id uuid [ref: > User.user_id]
  message_body text [not null]
  sent_at timestamp
}



