#!/usr/bin/env ruby
require 'rubygems'
require 'bundler/setup'

$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "connfu_app"

run ConnfuApp