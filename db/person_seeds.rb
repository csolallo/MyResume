Resume::Models::Person.create(
  name: 'Carlos Sola-Llonch',
  uuid: `uuidgen`.chomp!,
  address1: '4141 49 Ave SW',
  city: 'Seattle',
  state: 'WA',
  zip: '98116',
  email: 'csolallo@comcast.net',
  number: '206-384-3991'  
)

me = Resume::Models::Person.first

me.certificates.create(
  origin: 'Florida International University',
  title: 'B.S. in Mathematics, Minor in Computer Science',
  year: 1991
)

me.highlights << Resume::Models::Accomplishment.create(
  description: 'Over 19 years of experience as a software developer.'
)

me.highlights << Resume::Models::Accomplishment.create(
  description: 'Experience with all facets of the development lifecycle.'
)

me.highlights << Resume::Models::Accomplishment.create(
  description: 'Experience leading software development teams.'
)

me.highlights << Resume::Models::Accomplishment.create(
  description: 'Experience with agile project managment methodologies.'
)

me.highlights << Resume::Models::Accomplishment.create(
  description: 'Team player capable of juggling multiple assignments.'
)