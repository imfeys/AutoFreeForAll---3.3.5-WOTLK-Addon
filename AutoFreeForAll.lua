local frame = CreateFrame("Frame")

frame:RegisterEvent("PARTY_MEMBERS_CHANGED")
frame:RegisterEvent("RAID_ROSTER_UPDATE")

frame:SetScript("OnEvent", function()
    local inParty = GetNumPartyMembers() > 0
    local inRaid  = GetNumRaidMembers() > 0

    if inParty or inRaid then
        local isLeader = IsPartyLeader() or IsRaidLeader()

        if isLeader then
            local lootMethod = GetLootMethod()

            if lootMethod ~= "freeforall" then
                SetLootMethod("freeforall")
                DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00AutoFFA: Loot set to Free For All.|r")
            end
        end
    end
end)
