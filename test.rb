#!/usr/bin/env ruby -rubygems
require 'chukan'
include Chukan
include Chukan::Test

SVRCMD = "./kvs kvs.yaml"
CLICMD = "./kvc kvs.yaml"

node1 = spawn("#{SVRCMD} node1").set_display("kvs node1")
node2 = spawn("#{SVRCMD} node2").set_display("kvs node2")
node3 = spawn("#{SVRCMD} node3").set_display("kvs node3")
node4 = spawn("#{SVRCMD} node4").set_display("kvs node4")
node1.stdout_join("start")
node2.stdout_join("start")
node3.stdout_join("start")
node4.stdout_join("start")

tasks = (1..5).map {|i| ["key#{i}", "val#{i}"] }

tasks.each do |key, val|
	test "set value" do
		cli = spawn("#{CLICMD} #{key} #{val}")
		stat = cli.join
		stat.exitstatus == 0
	end
end

tasks.each do |key, val|
	test "get value" do
		cli = spawn("#{CLICMD} #{key}")
		stat = cli.join
		retval = cli.stdout.gets.rstrip
		retval == val && stat.exitstatus == 0
	end
end

