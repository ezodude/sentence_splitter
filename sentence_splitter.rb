require 'java'
require 'sinatra/base'
require 'json'

%w{jwnl-1.3.3.jar  maxent-2.5.2.jar  opennlp-tools-1.4.3.jar  trove.jar}.each do |jar|
  require File.dirname(__FILE__) + "/" + jar
end

def opennlp
  Java::opennlp
end

class SentenceSplitter < Sinatra::Base
  @@sentence_detector = opennlp.tools.lang.english.SentenceDetector.new(File.dirname(__FILE__) + "/EnglishSD.bin.gz")

  post '/' do
    sentences = @@sentence_detector.sentDetect(params[:content]).collect(&:to_s)
    { :sentences => sentences }.to_json
  end
end