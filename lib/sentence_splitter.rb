require 'java'
require 'sinatra/base'
require 'json'

%w{jwnl-1.3.3.jar  maxent-2.5.2.jar  opennlp-tools-1.4.3.jar  trove.jar}.each do |jar|
  require File.dirname(__FILE__) + "/java/" + jar
end

def opennlp
  Java::opennlp
end

SentenceDetector = opennlp.tools.lang.english.SentenceDetector

class SentenceSplitter < Sinatra::Base
  @@path_to_trained_data = File.expand_path("./EnglishSD.bin.gz", File.dirname(__FILE__))
  @@sentence_detector = SentenceDetector.new(@@path_to_trained_data)

  post '/' do
    sentences = @@sentence_detector.sentDetect(params[:content]).collect(&:to_s)
    { :sentences => sentences }.to_json
  end
end