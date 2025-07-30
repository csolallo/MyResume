
uuid = nil
if Rails.env == "test"
    uuid = Rails.application.config.info[:uuid]
end

Person.create(
  name: 'Carlos Sola-Llonch',
  uuid: uuid ||`uuidgen`.chomp!,
  address1: '4141 49 Ave SW',
  city: 'Seattle',
  state: 'WA',
  zip: '98116',
  email: 'csolallo@comcast.net',
  number: '206-384-3991'  
)

me = Person.first

me.certificates.create(
  origin: 'Florida International University',
  title: 'B.S. in Mathematics, Minor in Computer Science',
  year: 1991
)

me.highlights << Accomplishment.create(
  description: 'Senior level software development expertise.'
)

me.highlights << Accomplishment.create(
  description: 'Experience with all facets of the development lifecycle.'
)

me.highlights << Accomplishment.create(
  description: 'Experience leading software development teams.'
)

me.highlights << Accomplishment.create(
  description: 'Experience with agile project managment methodologies.'
)

me.highlights << Accomplishment.create(
  description: 'Team player capable of juggling multiple assignments.'
)