require 'json'
JSON.parse(File.read('/home/linlin/Downloads/all-traits\(2\).json')).each do |json|
  Rails.logger.info json.ispect
  background = json['Background']
  skin = json['Skin']
  clothes = json['Clothes']
  mouth = json['Mouth']
  nose = json['Nose']
  eyes = json['Eyes']
  mustache = json['Mustache']
  hair = json['Hair']
  glasses = json['Glasses']
  gesture = json['Gesture']
  tech_element = json['Tech element']
  tempHash = {
    "description" => "Congratulations to get the Parachain NFT!",
    "external_link" => "https://www.parachain.io/",
    "external_url" => "https://www.parachain.io/",
    "animation_url" => "ipfs://QmRuTwaZdZ65aEAz5NPwz8N6QskQsTQwkX4X98ior9GaNN",
    "image" => "ipfs://QmQMJX4azuY2yREjprkwEUvX9caSAbPHE8MnwzpzLJungk",
    "name" => "Parastate Nft #0",

    "arrtributes" =>"
    [
      {
        "trait_type" => "Background",
        "value" => "background"
      },
      {
        "trait_type" => "Skin",
        "value" => skin
      },
      {
        "trait_type" => "Clothes",
        "value" => clothes
      },
      {
        "trait_type" => "Mouth",
        "value" => mouth
      },
      {
        "trait_type" => "Nose",
        "value" => nose
      },
      {
        "trait_type" => "Eyes",
        "value" => eyes
      },
      {
        "trait_type" => "Mustache",
        "value" => mustache
      },
      {
        "trait_type" => "Hair",
        "value" => hair
      },
      {
        "trait_type" => "Glasses",
        "value" => glasses
      },
      {
        "trait_type" => "Gesture",
        "value" => gesture
      },
      {
        "trait_type" => "Tech Element",
        "value" => tech_element
      }
    ]"
  }
  File.open("public/0.json","w") do |f|
    f.write(tempHash.to_json)
  end
end
