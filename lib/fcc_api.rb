require "fcc_api/version"
require 'net/http'
require 'uri'
require 'rubygems'
gem 'activesupport'
require 'active_support/all'

module FccApi
   class CensusBlock
     def initialize
       @base_uri = "https://geo.fcc.gov/api/census/"
     end
    
     def get_all(lat, lon, year = "2010")
       request ={
         "format" => "json",
         "latitude" => lat,
         "longitude" => lon,
         "showall" => "true",
         "censusYear" => year 
       }
       make_http_call(request, "block/find")
               
     end
     
     def get(lat, lon, year = "2010")
       request ={
         "format" => "json",
         "latitude" => lat,
         "longitude" => lon,
         "showall" => "false",
         "censusYear" => year 
       }
       make_http_call(request, "block/find")
               
     end
     
     
    
     private 
     
     def make_http_call(request, endpoint)
       url = URI.parse( @base_uri  + endpoint + "?" + request.to_query )
       response = Net::HTTP.get( url  )
       return  JSON.parse(response)     
     end
  end
end
