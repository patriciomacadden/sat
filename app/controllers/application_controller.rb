module SAT::Application
  class ApplicationController < Sinatra::Base
    set builder: Rack::Builder.new
    set controllers: []

    def self.inherited(subclass)
      controllers << subclass unless controllers.include? subclass
      subclass.set :app_file, caller_files.detect { |f| f != app_file }
      super
    end

    def self.new(*)
      self == ApplicationController ? builder.to_app : super
    end

    def self.prefix=(value)
      controller = self
      define_singleton_method(:prefix) { value }
      builder.map(value) { run controller }
    end

    def find_template(views, name, engine, &block)
      super(File.join(views, settings.views_prefix), name, engine, &block)
      super(File.join(views, settings.prefix), name, engine, &block)
      super(File.join(views, 'application'), name, engine, &block)
    end
  end
end
