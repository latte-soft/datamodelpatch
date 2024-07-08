local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_FaceAnimatorService_0 = game:GetService("FaceAnimatorService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v5 = nil;
local v6 = require(l_CorePackages_0.Packages.React);
local l_Sounds_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).Sounds;
local l_SoundGroups_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundGroups;
local l_SoundManager_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundManager;
local l_ContactList_0 = l_RobloxGui_0.Modules.ContactList;
local l_dependencyArray_0 = require(l_ContactList_0.dependencies).Hooks.dependencyArray;
local v12 = require(l_ContactList_0.Analytics.useAnalytics);
local v13 = require(l_ContactList_0.Analytics.EventNamesEnum);
local _ = require(l_ContactList_0.Enums.Pages);
return function(v15, v16, v17, v18, v19)
    local v20 = v12();
    return v6.useCallback(function()
        l_SoundManager_0:PlaySound(l_Sounds_0.Select.Name, {
            Volume = 0.5
        }, l_SoundGroups_0.Iris);
        if v5 == nil then
            v5 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
        end;
        local v21 = not (v5.localMuted ~= nil) or v5.localMuted;
        local v22 = not not l_FaceAnimatorService_0:IsStarted() and l_FaceAnimatorService_0.VideoAnimationEnabled;
        v20.fireEvent(v13.PhoneBookCallFriendClicked, {
            eventTimestampMs = os.time() * 1000, 
            friendUserId = tonumber(v16), 
            searchQueryString = v19.searchQueryString, 
            itemListIndex = v19.itemListIndex, 
            isSuggestedUser = v19.isSuggestedUser, 
            page = tostring(v19.page)
        });
        coroutine.wrap(function()
            l_RobloxReplicatedStorage_0:WaitForChild("ContactListInvokeIrisInvite", math.huge):FireServer(v15, tonumber(v16), v17, v21, v22);
        end)();
        v18();
    end, l_dependencyArray_0(v15, v16, v17, v18, v19));
end;
