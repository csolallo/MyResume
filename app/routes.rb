module Resume
  module Routes
    autoload :PersonNotFound, './app/routes/exceptions'
    autoload :ResumeNotFound, './app/routes/exceptions'
    autoload :JobNotFound,    './app/routes/exceptions'
    
    autoload :Base,   './app/routes/base'
    autoload :Person, './app/routes/person'
    autoload :Resume, './app/routes/resume'
  end
end