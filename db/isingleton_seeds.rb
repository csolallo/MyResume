company_name = 'ISingleton, Inc.'
Company.create(
  name: company_name,
  city: 'Sacramento',
  state: 'CA'
)

company = Company.find_by_name(company_name)

company.roles.create(
  title: 'Software Developer/Architect',
  start_date: '3/1/2007'.to_date,
  end_date: '5/1/2007'.to_date
)

role = company.roles.find_by_title('Software Developer/Architect')

role.projects.create(
  name: 'Multimedia content management system',
  description: 'Windows service based system that threads and manages multiple plugins responsible for: playlist generation, reporting, and hardware control.'
)

project = role.projects.find_by_name('Multimedia content management system')

project.accomplishments.create(
  description: 'Architected Windows service. Uses AppDomain Shadow Copy so that plugin and/or service updates produce zero downtime. This service makes extensive use of .Net 2 framework enhancements.'
)

project.accomplishments.create(
  description: 'Implemented the web services based communication between the store windows service and Starbucks corporate. This was done using Microsoft''s WSE3 assemblies.'
)

project.accomplishments.create(
  description: 'Implemented web site where store partners can request to interrupt the auto generated store playlist. Done using ASP.Net 2.0 (specifically, using master pages).'
)

company.roles.create(
  title: 'Lead Developer',
  start_date: '7/1/2005'.to_date,
  end_date: '12/1/2006'.to_date
)

role = company.roles.find_by_title('Lead Developer')

role.projects.create(
  name: 'Automated visual editor tool',
  description: 'Pilot project to codify cancer abstract verification rules.'
)

project = role.projects.find_by_name('Automated visual editor tool')

project.accomplishments.create(
  description: 'Design of the initial XML schema based business object model.'
)

project.accomplishments.create(
  description: 'Developed XSLT transforms to import the existing business object structure into the ILog business object model.'
)

project.accomplishments.create(
  description: 'Design and development of the rules test harness (C#) for debugging rules. The harness is equivalent to a NUnit (or similar) harness.'
)

project.accomplishments.create(
  description: 'Architected the integration point of the rules engine and the existing application.'
)

project.accomplishments.create(
  description: 'Assisted in the creation of the Rules Requirement artifact in Rational ClearCase.'
)

company.roles.create(
  title: 'Technical Lead/Architect',
  start_date: '9/1/2001'.to_date,
  end_date: '1/1/2007'.to_date
)

role = company.roles.find_by_title('Technical Lead/Architect')

role.projects.create(
  name: 'Eureka',
  description: 'Centralized state-wide cancer reporting system. Eureka has two aspects, an interactive, web-based data entry aspect and a batch oriented, service-based data processing aspect.'
)

project = role.projects.find_by_name('Eureka')

project.accomplishments.create(
  description: 'Designed Eureka''s role based security model.'
)

project.accomplishments.create(
  description: 'Designed Eureka''s batch (EDI) processing infrastructure. These services communicate asynchronously using MSMQ messages.'
)

project.accomplishments.create(
  description: 'Implemented XML Schema and XSLT Transforms used in the inter-regional communication process.'
)

project.accomplishments.create(
  description: 'Designed and implemented sophisticated, weighted, probabilistic linkage algorithm.'
)

project.accomplishments.create(
  description: 'Led many design sessions for add-on modules such as pre-processing and custom inquiry.'
)