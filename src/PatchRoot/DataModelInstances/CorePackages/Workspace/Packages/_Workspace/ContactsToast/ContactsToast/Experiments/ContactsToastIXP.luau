local l_script_FirstAncestor_0 = script:FindFirstAncestor("ContactsToast");
local l_useUserExperiment_0 = require(l_script_FirstAncestor_0.Parent.RoactAppExperiment).useUserExperiment;
local v2 = require(l_script_FirstAncestor_0.Flags.FStringSocialFriendsLayer);
local v3 = require(l_script_FirstAncestor_0.Flags.FStringContactsToastButtonKey);
local v4 = game:DefineFastFlag("ContactsToastExperimentEnabledv1", false);
local function v6(v5)
    if v4 then
        return (v5[v2] or {})[v3];
    else
        return false;
    end;
end;
return {
    FFlagContactsToastExperimentEnabled = v4, 
    useContactsToastVariant = function()
        if v4 then
            return (l_useUserExperiment_0({
                v2
            }, v6));
        else
            return false;
        end;
    end
};
