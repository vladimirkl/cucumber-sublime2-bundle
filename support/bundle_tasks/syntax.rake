desc 'Generates the plain text and steps syntax files for all languages supported by the latest Gherkin'
task :i18n_generate do
  require 'erb'
  require 'gherkin/i18n'

  { 'plaintext_template.erb' => 'Cucumber Plain Text Feature.tmLanguage',
    'steps_template.erb' => 'Cucumber Steps.tmLanguage'
  }.each do |k,v|
    template = ERB.new(IO.read(File.dirname(__FILE__) + '/../../Syntaxes/'+ k))
    File.open(File.dirname(__FILE__) + '/../../Syntaxes/'+ v, "wb") do |io|
      io.write(template.result(binding))
    end
  end  
end
