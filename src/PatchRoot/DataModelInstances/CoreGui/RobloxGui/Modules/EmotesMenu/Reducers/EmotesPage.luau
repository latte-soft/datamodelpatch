local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Cryo);
local v2 = require(l_CorePackages_0.Rodux);
local l_Actions_0 = script.Parent.Parent.Actions;
local v4 = require(l_Actions_0.EmotesChanged);
local v5 = require(l_Actions_0.EquippedEmotesChanged);
local v6 = require(l_Actions_0.NumberEmotesLoadedChanged);
local v7 = {
    emotesInfo = {}, 
    equippedEmotes = {}, 
    numberEmotesLoaded = -1, 
    currentEmotes = {}
};
local function v15(v8, v9)
    local v10 = {};
    for _, v12 in ipairs(v9) do
        local l_Slot_0 = v12.Slot;
        local l_Name_0 = v12.Name;
        if not ((not l_Slot_0 or not l_Name_0) or not v8[l_Name_0]) then
            v10[l_Slot_0] = l_Name_0;
        end;
    end;
    return v10;
end;
return v2.createReducer(v7, {
    [v4.name] = function(v16, v17)
        return v1.Dictionary.join(v16, {
            emotesInfo = v17.emotes, 
            currentEmotes = v15(v17.emotes, v16.equippedEmotes)
        });
    end, 
    [v5.name] = function(v18, v19)
        return v1.Dictionary.join(v18, {
            equippedEmotes = v19.equippedEmotes, 
            currentEmotes = v15(v18.emotesInfo, v19.equippedEmotes)
        });
    end, 
    [v6.name] = function(v20, v21)
        return v1.Dictionary.join(v20, {
            numberEmotesLoaded = v21.numberEmotesLoaded
        });
    end
});
