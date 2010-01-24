Sentence Detector
=================

This is a simple Sinatra web service that uses JRuby and (OpenNLP)[http://opennlp.sourceforge.net] to split input into sentences.

Installation
============

sentence_detector requires the the json_jruby, and sinatra gems. Everythign else is included.

Just run it like you would any other Sinatra app (with Passenger, or rackup).

Usage
=====

Simply POST the text you want to parse in a param named "content" to the root, and sentence_detector will return a json object with the key "sentences" set to an array of strings, where each string is a sentence.

Example:

    RestClient.post('http://localhost:9292/', {:content => 'This is a sentence. This is another sentence. Hello Mr. Potter, have you completed your O.W.L.?'})
    => {"sentences":["This is a sentence. ","This is another sentence. ","Hello Mr. Potter, have you completed your O.W.L.?"]}
