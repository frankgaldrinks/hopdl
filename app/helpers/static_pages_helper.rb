module StaticPagesHelper

  def downloadlinks(link)
    chopped = link.split("/")
    id = ""
    chopped.each do |chop|
        if chop.include? "id."
            id = chop.gsub(/id./, "")
            break
        end
    end

    if id != ""
        resp = RestClient.post 'http://www.hiphopdx.com/index/singles/ajax.track', :id => id

        parselink = JSON.parse(resp)

        #puts the mp3 file name into mp3 and removes the ? from the end of the string 
        mp3 = parselink["file"].chomp("?")
        return mp3
    else
        return false
    end
  end
end
