require 'rubygems'
require 'rdf'
require 'linkeddata'

g = RDF::Graph.load("my.rdf")

#puts g.to_ttl

q = "
  PREFIX bf: <http://bibframe.org/vocab/>
  SELECT *
    WHERE {
      ?person a bf:Person .
      ?person bf:label ?label
    }"

s = SPARQL.parse(q)

#puts s.inspect

s.execute(g) do |result|
  puts result.label
end
