#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;
use DDG::Test::Goodie;

zci answer_type => 'private_network';
zci is_cached => 1;

ddg_goodie_test(
        [qw(
                DDG::Goodie::PrivateNetwork
        )],
        map { ("$_" => test_zci(
            'Private network IPv4 addresses (rfc1918):
10.0.0.0 - 10.255.255.255 | 10.0.0.0/8
172.16.0.0 - 172.31.255.255 | 172.16.0.0/12
192.168.0.0 - 192.168.255.255 | 192.168.0.0/16

Carrier NAT IPv4 private addresses (rfc6598):
100.64.0.0 - 100.127.255.255 | 100.64.0.0/10

Test Networks (rfc5735):
TEST-NET-1: 192.0.2.0 - 192.0.2.255 | 192.0.2.0/24
TEST-NET-2: 198.51.100.0 - 198.51.100.255 | 198.51.100.0/24
TEST-NET-3: 203.0.113.0 - 203.0.113.255 | 203.0.113.0/24
Benchmarks: 198.18.0.1 - 198.19.255.255 | 198.18.0.0/15

Private network IPv6 addresses (rfc4193):
Unique local addresses: fd00::/8
',
        html => 'Private network IP addresses:
<br>IPv4 addresses (<a href="https://www.ietf.org/rfc/rfc1918.txt">rfc1918</a>):
<br>10.0.0.0 - 10.255.255.255 | 10.0.0.0/8
<br>172.16.0.0 - 172.31.255.255 | 172.16.0.0/12
<br>192.168.0.0 - 192.168.255.255 | 192.168.0.0/16
<br>
<br>Carrier NAT (<a href="https://www.ietf.org/rfc/rfc6598.txt">rfc6598</a>):
<br>100.64.0.0 - 100.127.255.255 | 100.64.0.0/10
<br>
<br>Test Networks (<a href="https://www.ietf.org/rfc/rfc5735.txt">rfc5735</a>):
<br>TEST-NET-1: 192.0.2.0 - 192.0.2.255 | 192.0.2.0/24
<br>TEST-NET-2: 198.51.100.0 - 198.51.100.255 | 198.51.100.0/24
<br>TEST-NET-3: 203.0.113.0 - 203.0.113.255 | 203.0.113.0/24
<br>Benchmarks: 198.18.0.1 - 198.19.255.255 | 198.18.0.0/15
<br>
<br>Private network IPv6 addresses (<a href="https://www.ietf.org/rfc/rfc4193.txt">rfc4193</a>):
<br>Unique local addresses: fd00::/8
'
)) } ( 'private network' ) #, 'private networks', 'private ip', 'private ips' )
);

done_testing;
