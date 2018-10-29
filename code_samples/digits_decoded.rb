LOOKUP = ('1'..'26').to_a.zip('A'..'Z').to_h
# {
#  "1"=>"A", "2"=>"B", "3"=>"C", "4"=>"D", "5"=>"E", "6"=>"F", "7"=>"G",
#  "8"=>"H", "9"=>"I", "10"=>"J", "11"=>"K", "12"=>"L", "13"=>"M", "14"=>"N",
#  "15"=>"O", "16"=>"P", "17"=>"Q", "18"=>"R", "19"=>"S", "20"=>"T", "21"=>"U",
#  "22"=>"V", "23"=>"W", "24"=>"X", "25"=>"Y", "26"=>"Z"
# }

def decode(str, dec)
  if str.length.zero?
    print dec
    puts
  end

  if str.length > 0 && LOOKUP[str[0]]
    decode(str[1..-1], dec + LOOKUP[str[0]])
  end

  if str.length > 1 && LOOKUP[str[0..1]]
    decode(str[2..-1], dec + LOOKUP[str[0..1]])
  end
end

decode('121', '')
# ABA
# AU
# LA
#  => nil

decode('32125', '')
# CBABE
# CBAY
# CBLE
# CUBE
# CUY
#  => nil
