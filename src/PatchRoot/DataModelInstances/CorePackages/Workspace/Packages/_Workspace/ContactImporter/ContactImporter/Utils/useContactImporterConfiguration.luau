local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_0.Flags.OffPlatformFriendRequestsIXP);
local l_useSelector_0 = v1.useSelector;
local v5 = require(script.Parent.getContactImporterParams);
local l_useUiModeInfo_0 = require(l_Parent_1.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_Parent_1.RobloxAppEnums).UiMode;
return function(v8)
    local v10 = l_useSelector_0(function(v9)
        return v9.IsLocalUserSoothsayer;
    end);
    local v11 = l_useSelector_0(v5);
    local v12 = v3.useOffPlatformFriendRequestsEnabled();
    local v13 = not (l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot) and v10;
    local v14 = nil;
    local v15 = nil;
    if not v13 then
        v15 = v12 and v8.policyIsEnabled;
        v14 = v11.shouldShowContactImporterFeature;
    else
        v15 = true;
        v14 = true;
    end;
    local v16 = v15 and v14;
    return {
        shouldFetchContactImporterData = v15 or false, 
        shouldShowContactImporter = v16 or false, 
        shouldShowContactImporterModal = v16 and v11.shouldShowContactImporterUpsellModal or false
    };
end;
