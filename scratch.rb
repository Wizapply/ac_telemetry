#!/usr/bin/env ruby

require 'pry'
require 'bindata'
require 'ap'

class RTCarInfo < BinData::Record
  string :identifier, read_length: 4 # 4 bytes
  int32le :rt_size # 4 bytes
  float_le :speed_kmh # 4 bytes
  float_le :speed_mph # 4 bytes
  float_le :speed_ms # 4 bytes
end


rt_car_info_raw = "a\x00\x00\x00H\x01\x00\x00\xFF\xB1\xB1;Y\xD4\\;qp\xC5:\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xD8\x95\x0F\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80?\x00\x00\x00\x00\x00\x80\tE\x00\x00\x00\x00\x01\x00\x00\x00\x00~\xE7>\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00#\xD7\xA3\xBC\xE8<B;,\xD7$>s\xB4\x1E=\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xB6o\xA1\xB9\xE6\xBA\r\xB9\xA4[+8\x17\x95\x979\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00q\xFC\xD5<\xB4O\xC6<'\x19\xB1;\xB9\xC3\xF7<\x8C\x87\bE\xC7\xEB\aE]L@E\x13\xE3AEv\xA5\xA9?\xB5\xDF\xA9?\xE6Y\xA1?\xBE\xF9\xA0?\xCE\x03\xF2:\xD6(1\xBC\xC7(\xB0;\xC6r\xFD\xBC\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80G\x16\xBDr\xA2\x16\xBD[\x01\x03\xBD\xDA\xAB\xFF\xBC\x87\x16\x99>\x87\x16\x99>\x89A\xA0>\x89A\xA0>\xE3\xE1\x95>\xE3\xE5\x95>\xA5:\x9C>\x912\x9C>\xC0!,=\xC0\x19,=4] =D\x00\"=euy?\x00\x00\x00\x00g*\xA1CSG?C\xE8\xF6CC"

puts "Passing #{rt_car_info_raw.bytesize} bytes to RTCarInfo#read"

rtci = RTCarInfo.read(rt_car_info_raw)

ap RTCarInfo.read(rt_car_info_raw)

binding.pry