company_name = 'Requested'
Resume::Models::Company.create(
    name: company_name,
    address1: '2533 R Street',
    city: 'Sacramento',
    state: 'CA',
    zip: '95816'
)

company = Resume::Models::Company.find_by_name(company_name)
company.roles.create(
    title: 'Software Engineer/Technologist',
    start_date: '4/1/2015'.to_date,
    end_date: '2/8/2016'.to_date
)

role = company.roles.find_by_title('Software Engineer/Technologist')

role.projects.create(
    name: 'Support and on-boarding web application',
    description: 'Internal tool used to manage and on-board merchants, and to manage existing customers'
)

role.projects.create(
    name: 'Merchant app',
    description: 'App used by merchants to accept inbound requests, close out orders, and to assign kudos (rewards)'
)

role.projects.create(
    name: 'Consumer app',
    description: 'App used by customers to place requests (reservations) at restaurants and bars'
)

project = role.projects.find_by_name('Support and on-boarding web application')

project.accomplishments.create(
    description: 'Introduced a responsive layout and provided consistent theming'
)
project.accomplishments.create(
    description: 'Introduced support for ES6 and npm-based client-side packaging'
)
project.accomplishments.create(
    description: 'Implemented merchant image uploading with server-side processing'
)
project.accomplishments.create(
    description: 'Implemented promo code generation and reporting'
)
project.accomplishments.create(
    description: 'Implemented scheduled processing for merchant and consumer communications'
)
project.accomplishments.create(
    description: 'Introduced analytics widgets to the application’s dashboard'
)
project.accomplishments.create(
    description: 'Introduced unit tests'
)

project = role.projects.find_by_name('Merchant app')

project.accomplishments.create(
    description: 'Set up infrastructure for merchant device deployment using Apple’s MDM'
)

project.accomplishments.create(
    description: 'Ongoing rewrite of as a native-only app'
)

project = role.projects.find_by_name('Consumer app')

project.accomplishments.create(
    description: 'Implemented mechanism to prevent sign-up fraud'
)

project.accomplishments.create(
    description: 'Worked on promo code processing'
)

project.accomplishments.create(
    description: 'Introduced support for CoreSpotlight for merchant and open requests'
)

project.apps.create(
    name: 'Requested',
    platform: 'iOS',
    url: 'https://itunes.apple.com/us/app/requested/id916399770?ls=1&mt=8',
    image_url: 'http://a3.mzstatic.com/us/r30/Purple49/v4/e5/be/3a/e5be3a4f-9676-f8dd-e48a-6b27e994ada3/icon175x175.jpeg'
)
