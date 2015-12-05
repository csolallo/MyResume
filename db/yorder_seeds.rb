company_name = 'Yorder'
Resume::Models::Company.create(
  name: company_name,
  city: 'Seattle',
  state: 'WA'
)
  
company = Resume::Models::Company.find_by_name(company_name)

company.roles.create(
  title: 'Founder/Developer',
  start_date: '9/1/2010'.to_date,
  end_date: '1/1/2012'.to_date
)

role = company.roles.find_by_title('Founder/Developer')

role.projects.create(
  name: 'Yorder mobile app',
  description: 'Yorder was the winner of the 2010 PayPal X Developers Challenge.'
)

project = role.projects.find_by_name('Yorder mobile app')

project.accomplishments.create(
  description: 'Designed and implemented the native harness for the iOS app.'
)

project.accomplishments.create(
  description: 'Co-designed and implemented the native-javascript bridge on the iOS platform.'
)

project.accomplishments.create(
  description: 'Developer on the PHP based vendor management porta'
)

project.accomplishments.create(
  description: 'Designed and implemented the PHP based service layer for the Market and Vendor services.'
)

project.apps.create(
  name: 'yorder',
  platform: 'iOS',
  url: 'https://itunes.apple.com/us/app/yorder/id422508599?mt=8',
  image_url: 'http://a2.mzstatic.com/us/r30/Purple/v4/1e/1c/7f/1e1c7f2d-ddea-93e2-4e66-17d5078571c0/icon175x175.jpeg',
  comment: 'I am no longer involved with Yorder. It looks like the app is no longer maintained.'
)