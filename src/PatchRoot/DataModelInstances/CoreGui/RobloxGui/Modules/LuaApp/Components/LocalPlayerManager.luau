local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppRunService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppRunService;
local l_AppSessionService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppSessionService;
local l_Logger_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).Logger;
local v9 = require(l_Modules_0.Common.RoactUtilities.ExternalEventConnection);
local v10 = require(l_Modules_0.LuaApp.Actions.SetUserMembershipType);
local v11 = require(l_Modules_0.LuaApp.Thunks.GetLocalUser);
local l_SessionType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SessionType;
local v13 = require(l_Modules_0.LuaApp.Thunks.Authentication.User);
local v14 = require(l_Modules_0.LuaApp.LuaAppBacktraceReporter);
local v15 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppFixLoggedOutInSessionJitter);
local v16 = require(l_Modules_0.LuaApp.Flags.GetFFlagSessionFixL1LifeCycle);
local function v18()
    local v17 = not not l_Players_0.LocalPlayer and l_Players_0.LocalPlayer.UserId or nil;
    if not (v17 ~= nil) or v17 <= 0 then
        return nil;
    else
        return (tostring(v17));
    end;
end;
local v19 = nil;
if v15() then
    v19 = function()
        local l_userId_0 = v13.fromLocalStorage().userId;
        if l_userId_0 > 0 then
            return (tostring(l_userId_0));
        else
            return nil;
        end;
    end;
end;
local v21 = v3.Component:extend("LocalPlayerManager");
v21.defaultProps = {
    backtraceReporter = nil, 
    getLocalPlayerUserId = v18, 
    getCachedUserId = if not v15() then nil else v19
};
v21.init = function(v22)
    v22:setState({
        hasLocalPlayer = l_Players_0.LocalPlayer ~= nil, 
        localPlayerUserId = v22.props.getLocalPlayerUserId()
    });
    v22.backtraceReporter = v22.props.backtraceReporter or v14;
    v22.fetchAndUpdateLocalPlayer = function()
        v22.props.fetchLocalUserData();
        v22.updateUserInfoToBacktrace();
        v22.updateLocalPlayerState();
    end;
    v22.updateLocalPlayerState = function()
        local v23 = v22.props.getLocalPlayerUserId();
        if v23 ~= v22.state.localPlayerUserId then
            v22:setState({
                localPlayerUserId = v23 or v3.None, 
                hasLocalPlayer = l_Players_0.LocalPlayer ~= nil
            });
        end;
    end;
    v22.updateUserInfoToBacktrace = function()
        local _ = nil;
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        v22.backtraceReporter:updateSharedAttributes(if not (l_LocalPlayer_0 ~= nil) or l_LocalPlayer_0.UserId <= 0 then {
            UserLoggedIn = false, 
            UserMembershipType = "Unknown", 
            UserIsUnder13 = "Unknown", 
            CountryCode = "Unknown"
        } else {
            UserLoggedIn = true, 
            UserMembershipType = tostring(l_LocalPlayer_0.MembershipType), 
            UserIsUnder13 = l_LocalPlayer_0:GetUnder13(), 
            CountryCode = v22.props.countryCode
        });
    end;
    v22.syncUserSession = function(v26)
        local l_sessionService_0 = v22.props.sessionService;
        local l_localPlayerUserId_0 = v22.state.localPlayerUserId;
        if not (not v15() or not v26) then
            local v29 = v22.props.getCachedUserId();
            if v29 then
                l_localPlayerUserId_0 = v29;
            end;
            l_Logger_0:info("LocalPlayerManager:syncUserSession(checkCachedUser==true) localPlayerUserId: {}, cachedUserId: {}", l_localPlayerUserId_0, v29);
        end;
        local v31 = if not v16() then nil else function(v30)
            if not l_sessionService_0:SessionExists(l_SessionType_0.StructuralIdentifier.Level1) then
                l_Logger_0:warning("LocalPlayerManager:syncUserSession, Level1 session is missing");
                l_sessionService_0:SetSession(l_sessionService_0:GetRootSID(), l_SessionType_0.StructuralIdentifier.Level1, l_SessionType_0.Tag.Level1.LoggedOut);
            elseif l_sessionService_0:GetMetadata(l_SessionType_0.StructuralIdentifier.Level1, l_SessionType_0.Metadata.User.UserId) ~= v30 then
                l_sessionService_0:SetSession(l_sessionService_0:GetRootSID(), l_SessionType_0.StructuralIdentifier.Level1, l_SessionType_0.Tag.Level1.Default);
                l_sessionService_0:SetMetadata(l_SessionType_0.StructuralIdentifier.Level1, l_SessionType_0.Metadata.User.UserId, v30);
                return ;
            end;
        end;
        local v32 = if not v16() then nil else function()
            if not l_sessionService_0:SessionExists(l_SessionType_0.StructuralIdentifier.Level1) or l_sessionService_0:GetSessionTag(l_SessionType_0.StructuralIdentifier.Level1) == l_SessionType_0.Tag.Level1.Default then
                l_sessionService_0:SetSession(l_sessionService_0:GetRootSID(), l_SessionType_0.StructuralIdentifier.Level1, l_SessionType_0.Tag.Level1.LoggedOut);
            end;
        end;
        if l_localPlayerUserId_0 ~= nil then
            if not v15() then
                local v33 = nil;
                if l_sessionService_0:SessionExists(l_SessionType_0.StructuralIdentifier.Level1) then
                    v33 = l_sessionService_0:GetMetadata(l_SessionType_0.StructuralIdentifier.Level1, l_SessionType_0.Metadata.User.UserId);
                end;
                if v33 ~= l_localPlayerUserId_0 then
                    l_sessionService_0:SetSession(l_sessionService_0:GetRootSID(), l_SessionType_0.StructuralIdentifier.Level1, l_SessionType_0.Tag.Level1.Default);
                    l_sessionService_0:SetMetadata(l_SessionType_0.StructuralIdentifier.Level1, l_SessionType_0.Metadata.User.UserId, l_localPlayerUserId_0);
                    return ;
                end;
            elseif not v16() then
                if not l_sessionService_0:SessionExists(l_SessionType_0.StructuralIdentifier.Level1) then
                    l_sessionService_0:SetSession(l_sessionService_0:GetRootSID(), l_SessionType_0.StructuralIdentifier.Level1, l_SessionType_0.Tag.Level1.LoggedOut);
                    return ;
                elseif l_sessionService_0:GetMetadata(l_SessionType_0.StructuralIdentifier.Level1, l_SessionType_0.Metadata.User.UserId) ~= l_localPlayerUserId_0 then
                    l_sessionService_0:SetSession(l_sessionService_0:GetRootSID(), l_SessionType_0.StructuralIdentifier.Level1, l_SessionType_0.Tag.Level1.Default);
                    l_sessionService_0:SetMetadata(l_SessionType_0.StructuralIdentifier.Level1, l_SessionType_0.Metadata.User.UserId, l_localPlayerUserId_0);
                    return ;
                end;
            else
                v31(l_localPlayerUserId_0);
                return ;
            end;
        elseif not v16() then
            if not l_sessionService_0:SessionExists(l_SessionType_0.StructuralIdentifier.Level1) then
                l_sessionService_0:SetSession(l_sessionService_0:GetRootSID(), l_SessionType_0.StructuralIdentifier.Level1, l_SessionType_0.Tag.Level1.LoggedOut);
            else
                l_sessionService_0:ReplaceSession(l_SessionType_0.StructuralIdentifier.Level1, l_SessionType_0.Tag.Level1.LoggedOut);
                return ;
            end;
        else
            v32();
            return ;
        end;
    end;
    local l_sessionService_1 = v22.props.sessionService;
    if v22.props.runService:IsStudio() then
        l_sessionService_1:RemoveSession(l_SessionType_0.StructuralIdentifier.Level1);
    end;
    if not v15() then
        v22.syncUserSession();
        return ;
    else
        v22.syncUserSession(true);
        return ;
    end;
end;
v21.render = function(v35)
    local l_setUserMembershipType_0 = v35.props.setUserMembershipType;
    local v37 = {
        PlayerRemovingConnection = v3.createElement(v9, {
            event = l_Players_0.PlayerRemoving, 
            callback = function()
                v35:setState({
                    hasLocalPlayer = l_Players_0.LocalPlayer ~= nil, 
                    localPlayerUserId = v3.None
                });
            end
        }), 
        PlayerAddedConnection = v3.createElement(v9, {
            event = l_Players_0.PlayerAdded, 
            callback = function()
                v35:setState({
                    hasLocalPlayer = l_Players_0.LocalPlayer ~= nil, 
                    localPlayerUserId = v35.props.getLocalPlayerUserId() or v3.None
                });
            end
        })
    };
    if v35.state.hasLocalPlayer then
        table.insert(v37, v3.createElement(v9, {
            event = l_Players_0.LocalPlayer:GetPropertyChangedSignal("MembershipType"), 
            callback = function()
                local l_LocalPlayer_1 = l_Players_0.LocalPlayer;
                l_setUserMembershipType_0(tostring(l_LocalPlayer_1.UserId), l_LocalPlayer_1.MembershipType);
                v35.updateUserInfoToBacktrace();
            end
        }));
    end;
    return v3.createElement("Folder", {}, v37);
end;
v21.didMount = function(v39)
    if v39.state.hasLocalPlayer then
        v39.props.fetchLocalUserData();
    end;
    v39.updateUserInfoToBacktrace();
    v39.updateLocalPlayerState();
    v39.localPlayerConnection = l_Players_0:GetPropertyChangedSignal("LocalPlayer"):Connect(v39.fetchAndUpdateLocalPlayer);
end;
v21.didUpdate = function(v40, v41, v42)
    if v42.localPlayerUserId ~= v40.state.localPlayerUserId then
        v40.syncUserSession();
    end;
    if v41.countryCode ~= v40.props.countryCode then
        v40.updateUserInfoToBacktrace();
    end;
end;
v21.willUnmount = function(v43)
    if v43.localPlayerConnection ~= nil then
        v43.localPlayerConnection:Disconnect();
        v43.localPlayerConnection = nil;
    end;
end;
return v4.connect(function(v44, _)
    return {
        countryCode = string.len(v44.CountryCode) > 0 and v44.CountryCode or "Unknown"
    };
end, function(v46)
    return {
        setUserMembershipType = function(v47, v48)
            v46(v10(v47, v48));
        end, 
        fetchLocalUserData = function()
            v46(v11());
        end
    };
end)((l_RoactServices_0.connect({
    sessionService = l_AppSessionService_0, 
    runService = l_AppRunService_0
})(v21)));
