function Image(img)
      if img.classes:find('myluafilter',1) then
        local f = io.open("my-addition/" .. img.src, 'r')
        local doc = pandoc.read(f:read('*a'))
        f:close()
        local caption = pandoc.utils.stringify(doc.meta.caption) 
        local studentname = pandoc.utils.stringify(doc.meta.studentname)
        local studentid = pandoc.utils.stringify(doc.meta.studentid)
        local description = "> " .. caption .. "  \n>" .. "Ονοματεπωνυμο Φοιτητη:" .. studentname .. "  \n>" .. "Aριθμος Mητρωου:" .. studentid
        return pandoc.RawInline('markdown',description)
    end
end
