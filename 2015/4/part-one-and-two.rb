require 'digest'

i = 0
secret = 'yzbqklnj'

for i in 0..1000000000 do
  input = "#{secret}#{i}"
  h = Digest::MD5.hexdigest input

  # for part 2, change this to 6 zeroes.
  if h.start_with? "00000"
    print i
    exit
  end
end


