require 'erb'

class Heartwood::BaseService

  def initialize(options = {})
    verify_options(options)
    process_options(options)
    process_required_attrs(options)
    process_attrs_with_defaults(options)
  end

  # ---------------------------------------- Required Attributes

  def self.required_attrs
    @required_attrs ||= []
  end

  def self.required_attr(*names)
    attr_accessor(*names)
    required_attrs << names
    required_attrs.flatten!.uniq!
  end

  # ---------------------------------------- Optional Attributes

  def self.optional_attrs
    @optional_attrs ||= []
  end

  def self.optional_attr(*names)
    attr_accessor(*names)
    optional_attrs << names
    optional_attrs.flatten!.uniq!
  end

  # ---------------------------------------- Attributes With Default Values

  def self.attrs_with_defaults
    @attrs_with_defaults ||= []
  end

  def self.attr_with_default(name, default_value)
    attr_accessor name
    attrs_with_defaults << [name, default_value]
  end

  # ---------------------------------------- Help Text

  def self.help
    help_file = Rails.root.join('app', 'services', 'help.erb')
    service = self
    $stdout.print ERB.new(File.read(help_file), nil, '-').result(binding)
    self
  end

  # ---------------------------------------- Base Calling Methods

  def self.call(options = {})
    new(options).call
  end

  def call
    raise 'The call method is missing in the service object.'
  end

  # ---------------------------------------- Private Methods

  private

    def process_required_attrs(_options)
      self.class.required_attrs.each do |name|
        if send(name).nil?
          raise ArgumentError, "Missing required option: #{name}"
        end
      end
    end

    def process_attrs_with_defaults(_options)
      self.class.attrs_with_defaults.each do |name, default_value|
        send("#{name}=", default_value) if send(name).blank?
      end
    end

    def process_options(options)
      options.each do |name, value|
        begin
          send("#{name}=", value) if send(name).blank?
        rescue NoMethodError
          raise "Option not permitted: #{name}"
        end
      end
    end

    def verify_options(options)
      return true if options.is_a?(Hash)
      raise ArgumentError, 'Must pass options as a hash.'
    end

end
