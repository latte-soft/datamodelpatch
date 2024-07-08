local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_Modules_0.LuaApp.Thunks.NavigateToUserInfo);
local v5 = require(l_Modules_0.Profile.Analytics.EntryPoints);
local v6 = require(l_Modules_0.LuaApp.Thunks.RequestFriendship);
local v7 = require(l_Modules_0.LuaApp.Thunks.AcceptFriendRequest);
local l_UserSearchTile_0 = require(script.Parent.Parent.api).UserSearchTile;
local l_ImpressionsTaggerWrapper_0 = require(l_CorePackages_0.Workspace.Packages.Impressions).ImpressionsTaggerWrapper;
local _ = require(l_CorePackages_0.Workspace.Packages.GraphQLServer);
return function(v11)
    local v12 = l_useDispatch_0();
    local function v14(v13)
        v12(v6(v11.networking, v13.userId));
    end;
    local function v16(v15)
        v12(v7(v11.networking, v15.userId));
    end;
    local function v18(v17)
        v12(v4(v17.userId, {
            profilePeekViewProps = {
                resetPeekView = true, 
                source = v5.PlayerSearch.rawValue(), 
                contextualInfoType = v17.contextualInfoType, 
                contextualInfoDisplay = v17.contextualInfoDisplay, 
                analyticsProps = {
                    userSearchSessionId = v11.Analytics.getInfoForAllEvents().userSearchSessionId
                }
            }, 
            entryPoint = v5.PlayerSearch
        }));
    end;
    return v1.createElement(l_ImpressionsTaggerWrapper_0, {
        impressionsIndex = v11.index, 
        impressionsTag = v11.impressionsTag, 
        renderComponent = function()
            return v1.createElement(l_UserSearchTile_0, {
                index = v11.index, 
                user = v11.user, 
                size = v11.size, 
                searchParameters = v11.searchParameters, 
                hasEmphasis = v11.hasEmphasis, 
                profileInsight = v11.profileInsight, 
                luaAppNetworkingRequests = {
                    requestFriendship = v14, 
                    acceptFriendRequest = v16
                }, 
                luaAppNavigation = {
                    navigateToUserInfo = v18
                }, 
                fireAnalyticsEvent = v11.Analytics.fireAnalyticsEvent
            });
        end
    });
end;
