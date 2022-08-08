require 'csv'
#i = 1
#loop do
  #table = CSV.parse(File.read("/csv/#{i}.csv"), headers: true)
table = CSV.parse(File.read("./csv/10.csv"), headers: true)
  puts "table is #{table.inspect} "
  table.each_with_index do |td|
    name = td['姓名']
    code = td['编号']
    puts "name: #{name}  编号： #{code}"
    a = File.read("20220303.svg")
    b = a.sub("###NAME###", "#{name}").sub("###NUMBER###", "#{code}")
#  File.write("2021-10-2--东莞清溪失联救援-#{name}-#{code}.svg", b)
    File.write("2023-3-3-秘书处大厦五楼生命救援-#{name}-#{code}.svg", b)
end
#  i = i + 1
#  if i > 10
#    break
#  end
#end

