json.array!(@translations) do |translation|
  json.extract! translation, :id, :startMore_pl, :startMore_en, :startMore_it, :aboutHeader_pl, :aboutHeader_en, :aboutHeader_it, :portfolioHeader_pl, :portfolioHeader_en, :portfolioHeader_it, :portfolioMore_pl, :portfolioMore_en, :portfolioMore_it, :carieerHeader_pl, :carieerHeader_en, :carieerHeader_it, :contactHeader_pl, :contactHeader_en, :contactHeader_it, :contactFollow_pl, :contactFollow_en, :contactFollow_it, :formName_pl, :formName_en, :formName_it, :formEmail_pl, :formEmail_en, :formEmail_it, :formTel_pl, :formTel_en, :formTel_it, :formContent_pl, :formContent_en, :formContent_it, :salonHeader_pl, :salonHeader_en, :salonHeader_it
  json.url translation_url(translation, format: :json)
end
