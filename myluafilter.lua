function Image(img)
    if img.classes:find('myluafilter',1) then
      local f = io.open("myluafilter/" .. img.src, 'r')
      local doc = pandoc.read(f:read('*a'))
      f:close()
      local context = pandoc.utils.stringify(doc.meta.context)
      local studentname = pandoc.utils.stringify(doc.meta.studentname)
      local studentid = pandoc.utils.stringify(doc.meta.studentid)
      local description = "> " .. context .. " " .. studentname
      return pandoc.RawInline('markdown',description)
    end
end
