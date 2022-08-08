Dir.entries('.').each do |e| if e.include? 'svg'
    #command = %Q{ffmpeg -i "#{e}"  "#{e.sub('svg', 'png')}"}
    command = %Q{ffmpeg -i "#{e}"  "#{e.sub('svg', 'jpg')}"}
    puts command
    `#{command}`
  end
end
