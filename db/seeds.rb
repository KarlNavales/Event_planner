user = User.create!(
  email: 'test@example.com',
  password: 'password',
  password_confirmation: 'password'
)

Event.create!(
  title: 'Team Meeting',
  description: 'Weekly team sync',
  start_time: DateTime.now + 1.day,
  end_time: DateTime.now + 1.day + 1.hour,
  location: 'Conference Room A',
  user: user
)

Event.create!(
  title: 'Product Launch',
  description: 'Launching our new product',
  start_time: DateTime.now + 3.days,
  end_time: DateTime.now + 3.days + 3.hours,
  location: 'Main Auditorium',
  user: user
)