local frame = CreateFrame("Frame")

frame:RegisterEvent("PARTY_MEMBERS_CHANGED")
frame:RegisterEvent("RAID_ROSTER_UPDATE")

frame:SetScript("OnEvent", function()
    local inParty = GetNumPartyMembers() > 0
    local inRaid  = GetNumRaidMembers() > 0

    if not inParty and not inRaid then return end
    if not (IsPartyLeader() or IsRaidLeader()) then return end

    local lootMethod = GetLootMethod()
    if lootMethod ~= "freeforall" then
        SetLootMethod("freeforall")

        -- Suppress chat message in LFD
        if not IsPartyLFG() then
            DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00AutoFFA: Loot set to Free For All.|r")
        end
    end
end)
