local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.UIBlox);
local l_GetFFlagIrisUseLocalizationProvider_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagIrisUseLocalizationProvider;
local l_BaseMenu_0 = v3.App.Menu.BaseMenu;
local l_Images_0 = v3.App.ImageSet.Images;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_ContactList_0 = l_RobloxGui_0.Modules.ContactList;
local v10 = require(l_ContactList_0.dependencies);
local l_useSelector_0 = v10.Hooks.useSelector;
local v12 = require(l_ContactList_0.Analytics.useAnalytics);
local v13 = require(l_ContactList_0.Analytics.EventNamesEnum);
local v14 = require(l_ContactList_0.Enums.FriendAction);
local v15 = nil;
local v16 = nil;
if not l_GetFFlagIrisUseLocalizationProvider_0() then
    v16 = require(l_RobloxGui_0.Modules.RobloxTranslator);
else
    v15 = v10.Hooks.useLocalization;
end;
return function(v17)
    local v18 = v12();
    local l_Theme_0 = l_useStyle_0().Theme;
    local v21 = l_useSelector_0(function(v20)
        if not v20.PlayerMenu.friend then
            return "";
        else
            return v20.PlayerMenu.friend.combinedName;
        end;
    end);
    local v23 = l_useSelector_0(function(v22)
        if not v22.PlayerMenu.friend then
            return nil;
        else
            return v22.PlayerMenu.friend.userId;
        end;
    end);
    local v24 = nil;
    if l_GetFFlagIrisUseLocalizationProvider_0() then
        v24 = v15({
            blockLabel = {
                "Feature.Call.Label.Block"; 
                combinedName = v21
            }, 
            unfriendLabel = {
                "Feature.Call.Label.Unfriend"; 
                combinedName = v21
            }
        });
    end;
    return v2.createElement(l_BaseMenu_0, {
        buttonProps = {
            {
                icon = l_Images_0["icons/actions/block"], 
                text = if not l_GetFFlagIrisUseLocalizationProvider_0() then v16:FormatByKey("Feature.Call.Label.Block", {
                    combinedName = v21
                }) else v24.blockLabel, 
                onActivated = function()
                    v18.fireEvent(v13.PhoneBookPlayerMenuBlockClicked, {
                        eventTimestampMs = os.time() * 1000, 
                        friendUserId = v23
                    });
                    v17.initiateConfirmation(v14.Block);
                end
            }, 
            {
                icon = l_Images_0["icons/actions/friends/friendRemove"], 
                text = if not l_GetFFlagIrisUseLocalizationProvider_0() then v16:FormatByKey("Feature.Call.Label.Unfriend", {
                    combinedName = v21
                }) else v24.unfriendLabel, 
                onActivated = function()
                    v18.fireEvent(v13.PhoneBookPlayerMenuUnfriendClicked, {
                        eventTimestampMs = os.time() * 1000, 
                        friendUserId = v23
                    });
                    v17.initiateConfirmation(v14.Unfriend);
                end
            }
        }, 
        background = l_Theme_0.BackgroundUIDefault, 
        width = UDim.new(0, 352), 
        position = UDim2.new(0.5, 0, 0.5, 0), 
        anchorPoint = Vector2.new(0.5, 0.5)
    });
end;
