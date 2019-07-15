company_name = 'HighPoint'
Company.create(
  name: company_name,
  address1: '20 E University Drive',
  address2: 'Suite 201',
  city: 'Tempe',
  state: 'AZ',
  zip: '85281'
)

company = Company.find_by_name(company_name)
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
  url: 'https://play.google.com/store/apps/details?id=edu.butler.mobile',
  image_url: 'https://lh3.ggpht.com/sq-TJVO6CyPUUNMDv4zuFCQO8ST2WKIWn4qgFL1C1-jEajMVibMOBnaUPsgc4n20dm4=w300-rw'
)

project.apps.create(
  name: 'Loyola',
  platform: 'android',
  url: 'https://play.google.com/store/apps/details?id=edu.luc.mobile',
  image_url: 'https://lh5.ggpht.com/MBwSimi0CLVSXnCBNdnDp-ze90zIg032hHZfUhEzYIZJNPl_nfXTHeArhRnqQmczRsI=w300-rw'
)

project.apps.create(
  name: 'UW-Platteville',
  platform: 'android',
  url: 'https://play.google.com/store/apps/details?id=edu.uwplatt.campus',
  image_url: 'https://lh6.ggpht.com/IikB3ICqpe51e2QodZ3A2hJDDLbN5KiTvW56E2U9-U4Om9Fe-cY6RNyL7ORPrJiEcw=w300-rw'
)

project.apps.create(
  name: 'CWU Mobile',
  platform: 'android',
  url: 'https://play.google.com/store/apps/details?id=com.blackboard.android.central.CWU',
  image_url: 'https://lh5.ggpht.com/PpXsOStYeAV2Se_fZjM7_WynBre74wdC7s_Z9Ics6EeEQm_WomCa0F5soF2tbIg1ThM=w300-rw'
)

project.apps.create(
  name: 'EagleMobile',
  platform: 'android',
  url: 'https://play.google.com/store/apps/details?id=edu.coppin.campus',
  image_url: 'https://lh5.ggpht.com/SY6k04QJAXdmg0nI6ffQ6acywPQNas_4A76EMg-uZyWdpCxm88e-b01blveWGEbunyRx=w300-rw'
)

project.apps.create(
  name: 'myLoneStar',
  platform: 'android',
  url: 'https://play.google.com/store/apps/details?id=edu.lonestar.campus',
  image_url: 'https://lh4.ggpht.com/P9JXACkR1UbakNYZzb1yv02Nq9nsetzD_ANNSd2e8nIsIO3VfnGLmPPU4iwQ7J6VKGA=w300-rw'
)

project.apps.create(
  name: 'Butler University',
  platform: 'iOS',
  url: 'https://itunes.apple.com/us/app/butler-university/id681356225?mt=8',
  image_url: 'http://a5.mzstatic.com/us/r30/Purple1/v4/8b/0c/52/8b0c5296-4829-594a-f445-6b887aaad9a1/icon175x175.jpeg'
)

project.apps.create(
  name: 'Loyola',
  platform: 'iOS',
  url: 'https://itunes.apple.com/us/app/loyola/id389224172?mt=8',
  image_url: 'http://a3.mzstatic.com/us/r30/Purple2/v4/00/5b/2e/005b2e02-6749-0b91-cc04-c42b479d22b2/icon175x175.jpeg'
)

project.apps.create(
  name: 'UW-Platteville',
  platform: 'iOS',
  url: 'https://itunes.apple.com/us/app/uw-platteville/id906107922?mt=8',
  image_url: 'http://a2.mzstatic.com/us/r30/Purple3/v4/fa/c9/18/fac91896-45c1-ee1d-ac76-40ae60bf2adc/icon175x175.png'
)

project.apps.create(
  name: 'CWU Mobile',
  platform: 'iOS',
  url: 'https://itunes.apple.com/us/app/cwu-mobile/id444519619?mt=8',
  image_url: 'http://a1.mzstatic.com/us/r30/Purple3/v4/5c/90/56/5c9056fa-e291-1b38-4eea-e6d9798551fe/icon175x175.jpeg'
)

project.apps.create(
  name: 'myLoneStar',
  platform: 'iOS',
  url: 'https://itunes.apple.com/us/app/mylonestar/id916298158?mt=8',
  image_url: 'http://a1.mzstatic.com/us/r30/Purple4/v4/0b/0b/3c/0b0b3cfa-e307-0a81-5e2f-8109922bea3a/icon175x175.jpeg'
)
