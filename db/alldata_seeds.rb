company_name = 'ALLDATA/Autozone'
Company.create(
  name: company_name,
  address1: '9650 West Taron Drive',
  address2: 'Suite 100',
  city: 'Elk Grove',
  state: 'CA',
  zip: '95757'
)

company = Company.find_by_name(company_name)

company.roles.create(
  title: 'Sr. Developer/Product Architect',
  start_date: '9/1/2007'.to_date,
  end_date: '1/1/2009'.to_date
)

role = company.roles.find_by_title('Sr. Developer/Product Architect')

role.projects.create(
  name: 'AllData/DiY',
  description: 'Customer facing web app that allows a user to view vehicle repair information.'
)

project = role.projects.find_by_name('AllData/DiY')

project.accomplishments.create(
  description: 'Worked with designer to streamline the purchasing process.'
)

project.accomplishments.create(
  description: 'Designed and implemented enhanced shopping cart.'
)

project.accomplishments.create(
  description: 'Designed and implemented a streamlined the account management sections of the site.'
)

role.projects.create(
  name: 'Technical Services Bulletin Site',
  description: 'Proof of concept web app that allows for full-text searching of the TSB database.'
)

project = role.projects.find_by_name('Technical Services Bulletin Site')

project.accomplishments.create(
  description: 'Created prototype using Apache''s Lucene full text indexing engine.'
)

role.projects.create(
  name: 'iShop 3 Enterprise Web Service',
  description: 'Reference implementation of the iShop 3 specification for reporting vehicle repair data.'
)

project = role.projects.find_by_name('iShop 3 Enterprise Web Service')

project.accomplishments.create(
  description: 'Designed and implemented the XML translation library used to transform XML messages between XHTML and iShop 3 XML.'
)

project.accomplishments.create(
  description: 'Designed and implemented session persistence library (the iShop service is a stateful web service).'
)

project.accomplishments.create(
  description: 'Wrote a Flex 3 client that serves as a reference implementation of an iShop 3 Web service client.'
)