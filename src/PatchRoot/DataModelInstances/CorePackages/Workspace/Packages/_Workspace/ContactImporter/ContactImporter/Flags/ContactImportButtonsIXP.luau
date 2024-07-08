local v0 = require(script:FindFirstAncestor("ContactImporter").Parent.RoactAppExperiment);
local v1 = game:DefineFastString("ContactImportLayer", "Social.ContactList");
local v2 = game:DefineFastString("ContactImportGreenFindFriendsButtonExperimentVariable", "green_find_friends_button");
local v3 = game:DefineFastString("ContactImportRemoveCloseButtonExperimentVariable", "remove_close_button");
local l_useUserExperiment_0 = v0.useUserExperiment;
local function v6(v5)
    return ((v5 or {})[v1] or {})[v2] == true;
end;
local function v8(v7)
    return ((v7 or {})[v1] or {})[v3] == true;
end;
return {
    isGreenFindFriendsButtonExperimentEnabled = v6, 
    isRemoveCloseButtonExperimentEnabled = v8, 
    useIsGreenFindFriendsButtonExperimentEnabled = function(v9)
        return l_useUserExperiment_0({
            v1
        }, v6, v9.isExposureEnabled);
    end, 
    useIsRemoveCloseButtonExperimentEnabled = function(v10)
        return l_useUserExperiment_0({
            v1
        }, v8, v10.isExposureEnabled);
    end
};
