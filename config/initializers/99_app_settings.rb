module AppSettings
  #require 'deep_symbolizable'
  # it's a singleton, thus implemented as a self-extended module
  extend self

  @_settings = {}
  attr_reader :_settings

  # This is the main point of entry - we call AppSettings.load! and provide
  # a name of the file to read as it's argument. We can also pass in some
  # options, but at the moment it's being used to allow per-environment
  # overrides in Rails
  def load!(filename, options = {})
    newsets = YAML::load_file(filename).deep_symbolize
    newsets = newsets[options[:env].to_sym] if \
                                               options[:env] && \
                                               newsets[options[:env].to_sym]
    deep_merge!(@_settings, newsets)
    
    @_settings.each do |k, v|  
      define_method(k) do     
      v  
      end 
    end
  end

  # Deep merging of hashes
  # deep_merge by Stefan Rusterholz, see http://www.ruby-forum.com/topic/142809
  def deep_merge!(target, data)
    merger = proc{|key, v1, v2|
      Hash === v1 && Hash === v2 ? v1.merge(v2, &merger) : v2 }
    target.merge! data, &merger
  end

  #def method_missing(name, *args, &block)
    #@_settings[name.to_sym] ||
    #fail(NoMethodError, "unknown configuration root #{name}", caller)
  #end

end