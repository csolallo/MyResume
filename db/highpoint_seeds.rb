company_name = 'HighPoint'
Resume::Models::Company.create(
  name: company_name,
  address1: '20 E University Drive',
  address2: 'Suite 201',
  city: 'Tempe',
  state: 'AZ',
  zip: '85281'
)

company = Resume::Models::Company.find_by_name(company_name)
company.roles.create(
  title: 'Director of Mobile Technologies',
  start_date: '3/1/2013'.to_date,
  end_date: '8/1/2014'.to_date
)

role = company.roles.find_by_title('Director of Mobile Technologies')

role.projects.create(
  name: 'Campus Solutions',
  description: 'Mobile/web application that improves the Oracle PeopleSoft Campus user experience.'
)

project = role.projects.find_by_name('Campus Solutions')

project.accomplishments.create(
  description: 'Architected HighPoint''s product platform'
)

project.accomplishments.create(
  description: 'Led the transition to new platform. This included managing a team of 3 internal developers and coordinating the efforts of an offshore company.'
)

project.accomplishments.create(
  description: 'Established the company mobile strategy.'
)

project.accomplishments.create(
  description: 'Established internal development best practices including automated  deployments, git branch management, and coding guidelines.'
)

project.accomplishments.create(
  description: 'Primary developer of the Android and iOS mobile apps.'
)

project.accomplishments.create(
  description: 'Assisted in the development core platform UI web components.'
)

project.accomplishments.create(
  description: 'Assist in sales and marketing as necessary.'
)

project.apps.create(
  name: 'Butler University',
  platform: 'android',
  url: 'https://play.google.com/store/apps/details?id=edu.butler.mobile'
)

project.apps.create(
  name: 'Loyola',
  platform: 'android',
  url: 'https://play.google.com/store/apps/details?id=edu.luc.mobile'
)

project.apps.create(
  name: 'UW-Platteville',
  platform: 'android',
  url: 'https://play.google.com/store/apps/details?id=edu.uwplatt.campus'
)

project.apps.create(
  name: 'CWU Mobile',
  platform: 'android',
  url: 'https://play.google.com/store/apps/details?id=com.blackboard.android.central.CWU'
)

project.apps.create(
  name: 'EagleMobile',
  platform: 'android',
  url: 'https://play.google.com/store/apps/details?id=edu.coppin.campus'
)

project.apps.create(
  name: 'myLoneStar',
  platform: 'android',
  url: 'https://play.google.com/store/apps/details?id=edu.lonestar.campus'
)

project.apps.create(
  name: 'Butler University',
  platform: 'iOS',
  url: 'https://itunes.apple.com/us/app/butler-university/id681356225?mt=8'
)

project.apps.create(
  name: 'Loyola',
  platform: 'iOS',
  url: 'https://itunes.apple.com/us/app/loyola/id389224172?mt=8'
)

project.apps.create(
  name: 'UW-Platteville',
  platform: 'iOS',
  url: 'https://itunes.apple.com/us/app/uw-platteville/id906107922?mt=8'
)

project.apps.create(
  name: 'CWU Mobile',
  platform: 'iOS',
  url: 'https://itunes.apple.com/us/app/cwu-mobile/id444519619?mt=8'
)

project.apps.create(
  name: 'myLoneStar',
  platform: 'iOS',
  url: 'https://itunes.apple.com/us/app/mylonestar/id916298158?mt=8'
)
