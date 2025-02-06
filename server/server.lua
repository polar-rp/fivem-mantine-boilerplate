lib.callback.register('viral_printer:createDocument', function(source, url)
    local documentData = {}
    local OxPlayer = Ox.GetPlayer(source)
    local charId = OxPlayer.charId
    documentData.author, documentData.imageurl = charId, url

    local addItem = exports.ox_inventory:AddItem(OxPlayer.source, 'document', 1, documentData)
    if not addItem then return false end
    return true
end)