local v0 = require(script.Parent.Parent.Parent.ContactImporter.Common.Constants);
local l_game_EngineFeature_0 = game:GetEngineFeature(v0.UNIVERSAL_APP_CONTACT_IMPORTER_STORAGE_KEYS);
return {
    getLastOSPermissionSettings = function(_, v3)
        if l_game_EngineFeature_0 then
            local l_status_0, l_result_0 = pcall(function()
                return v3:GetItem(v0.LOCAL_STORAGE_KEY_LAST_CONTACTS_OS_PERMISSIONS);
            end);
            if not l_status_0 then
                return false;
            else
                return l_result_0 == "true";
            end;
        else
            return true;
        end;
    end, 
    updateOSPermissionSettings = function(_, v7, v8)
        if l_game_EngineFeature_0 then
            pcall(function()
                v7:SetItem(v0.LOCAL_STORAGE_KEY_LAST_CONTACTS_OS_PERMISSIONS, (tostring(v8)));
                v7:Flush();
            end);
            return ;
        else
            return ;
        end;
    end
};
