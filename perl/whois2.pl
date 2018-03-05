#!/usr/bin/perl

use LWP::Simple;                # From CPAN
use JSON qw( decode_json );     # From CPAN
use Data::Dumper;               # Perl core module
use strict;                     # Good practice
use warnings;                   # Good practice

my $base_url = "https://www.whoisxmlapi.com/whoisserver/WhoisService";
my $domain_name = "google.com";
my $format = "json";
my $api_key = "Your Whois API 2.0 API key";

# 'get' is exported by LWP::Simple;
my $url = "$base_url?domainName=$domain_name&outputFormat=$format";
$url = "$url&apiKey=$api_key";

print "Get data by URL: $url\n";
my $json = get($url);
die "Could not get $base_url!" unless defined $json;

# Decode the entire JSON
my $decoded_json = decode_json($json);

# Print fetched attribute
print "Domain Name: ", $decoded_json->{'WhoisRecord'}->{'domainName'}, "\n";
print "Contact Email: ", $decoded_json->{'WhoisRecord'}->{'contactEmail'}, "\n";