return function(v0)
    return {
        getAvatarHeaderIcon = function()
            return v0.AvatarHeaderIcon or "LuaApp/icons/ic-back";
        end, 
        getAvatarEditorShowBuyRobuxOnTopBar = function()
            return v0.AvatarEditorShowBuyRobuxOnTopBar or false;
        end, 
        getCustomOutfitNames = function()
            if v0.CustomCostumeNames ~= nil then
                return v0.CustomCostumeNames;
            else
                return true;
            end;
        end
    };
end;
