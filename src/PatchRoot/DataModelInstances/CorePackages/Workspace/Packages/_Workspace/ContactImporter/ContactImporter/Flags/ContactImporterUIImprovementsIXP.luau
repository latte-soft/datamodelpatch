local l_useUserExperiment_0 = require(script:FindFirstAncestor("ContactImporter").dependencies).useUserExperiment;
local v1 = game:DefineFastString("ThumbnailsInCILayer", "Social.ContactList");
local v2 = game:DefineFastString("ThumbnailsInCIVariable", "show_new_ci_ui");
local function _(v3)
    local v4 = nil;
    if v3 then
        v4 = v3[v2];
    end;
    return v4;
end;
local function v9(v6)
    local v7 = if not v6 then nil else v6[v1];
    local v8 = nil;
    if v7 then
        v8 = v7[v2];
    end;
    return v8 or false;
end;
return {
    useShouldDisplayUIImprovements = function()
        return l_useUserExperiment_0({
            v1
        }, v9);
    end
};
