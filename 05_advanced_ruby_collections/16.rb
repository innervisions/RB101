HEX_CHARS = %w[0 1 2 3 4 5 6 7 8 9 a b c d e f]
def make_uuid
  uuid = ''
  8.times { uuid << HEX_CHARS.sample }
  uuid << '-'
  4.times { uuid << HEX_CHARS.sample }
  uuid << '-'
  4.times { uuid << HEX_CHARS.sample }
  uuid << '-'
  4.times { uuid << HEX_CHARS.sample }
  uuid << '-'
  12.times { uuid << HEX_CHARS.sample }
  uuid
end

10.times { puts make_uuid }
