local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.CurrentCharacter);
local v2 = require(l_Parent_0.CharacterVersion);
local v3 = require(l_Parent_0.PlayingSwimAnimation);
local v4 = require(l_Parent_0.CharacterModelVersion);
local v5 = require(l_Parent_0.TryOnCharacterModelVersion);
local v6 = require(l_Parent_0.SavedCharacterModelVersion);
local v7 = require(l_Parent_0.ApplyingLayeredClothing);
local v8 = require(l_Parent_0.ShouldDelaySaveManager);
local v9 = require(l_Parent_0.WaitingOnLayeredClothingUpdates);
return function(v10, v11)
    v10 = v10 or {};
    return {
        CharacterVersion = v2(v10.CharacterVersion, v11), 
        CurrentCharacter = v1(v10.CurrentCharacter, v11), 
        PlayingSwimAnimation = v3(v10.PlayingSwimAnimation, v11), 
        ApplyingLayeredClothing = v7(v10.ApplyingLayeredClothing, v11), 
        CharacterModelVersion = v4(v10.CharacterModelVersion, v11), 
        TryOnCharacterModelVersion = v5(v10.TryOnCharacterModelVersion, v11), 
        SavedCharacterModelVersion = v6(v10.SavedCharacterModelVersion, v11), 
        ShouldDelaySaveManager = v8(v10.ShouldDelaySaveManager, v11), 
        WaitingOnLayeredClothingUpdates = v9(v10.WaitingOnLayeredClothingUpdates, v11)
    };
end;
