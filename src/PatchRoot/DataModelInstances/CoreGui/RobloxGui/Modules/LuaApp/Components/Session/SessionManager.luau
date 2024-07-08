local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_Modules_0.Common.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppSessionService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppSessionService;
local v6 = require(l_Modules_0.LuaApp.mutedError);
local l_SessionType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SessionType;
local v8 = require(l_Modules_0.LuaApp.AppPage);
local v9 = require(l_Modules_0.LuaApp.FlagSettings);
local v10 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux);
local l_selectCurrentLegacyRoute_0 = v10.Selectors.selectCurrentLegacyRoute;
local l_selectCurrentLegacyPage_0 = v10.Selectors.selectCurrentLegacyPage;
local function v22(v13)
    local l_Level2a_0 = l_SessionType_0.StructuralIdentifier.Level2a;
    local l_Level2b_0 = l_SessionType_0.StructuralIdentifier.Level2b;
    local v16 = {};
    local v17 = false;
    for v18 = #v13, 1, -1 do
        local l_name_0 = v13[v18].name;
        local v20 = nil;
        local v21 = nil;
        v20 = l_SessionType_0.Tag.Level2a[l_name_0];
        v21 = l_SessionType_0.Tag.Level2b[l_name_0];
        if not v20 then
            if not (v17 or not v21) then
                v16[l_Level2b_0] = v13[v18];
                v17 = true;
            end;
        else
            v16[l_Level2a_0] = v13[v18];
            break;
        end;
    end;
    v16[l_Level2a_0] = v16[l_Level2a_0] or {
        name = l_SessionType_0.Tag.Level2a.Unknown, 
        detail = nil
    };
    return v16;
end;
local v23 = v2.Component:extend("SessionManager");
v23.init = function(v24)
    v24.updateGameSearchSession = function()
        local l_sessionService_0 = v24.props.sessionService;
        local l_currentRoute_0 = v24.props.currentRoute;
        if l_sessionService_0 == nil then
            v6("SessionManager requires valid SessionService.");
            return ;
        else
            local v27 = false;
            if l_currentRoute_0 then
                for v28 = 1, #l_currentRoute_0 do
                    if l_currentRoute_0[v28].name == v8.SearchPage then
                        v27 = true;
                        break;
                    end;
                end;
            end;
            if not v27 then
                l_sessionService_0:RemoveSession(l_SessionType_0.StructuralIdentifier.GameSearch);
                l_sessionService_0:RemoveSession(l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete);
                l_sessionService_0:RemoveSession(l_SessionType_0.StructuralIdentifier.OmniSearch);
            end;
            return ;
        end;
    end;
    v24.updateSessionService = function(v29, v30, v31, v32)
        local l_sessionService_1 = v24.props.sessionService;
        local l_Level1_0 = l_SessionType_0.StructuralIdentifier.Level1;
        local l_Level2a_1 = l_SessionType_0.StructuralIdentifier.Level2a;
        local l_Level2b_1 = l_SessionType_0.StructuralIdentifier.Level2b;
        v31 = v31 or {
            name = l_SessionType_0.Tag.Level2a.Unknown
        };
        v32 = v32 or {};
        v29 = v29 or {};
        v30 = v30 or {};
        if not l_sessionService_1:SessionExists(l_Level1_0) then
            l_sessionService_1:SetSession(l_sessionService_1:GetRootSID(), l_Level1_0, l_SessionType_0.Tag.Level1.Default);
            l_sessionService_1:SetMetadata(l_Level1_0, l_SessionType_0.Metadata.User.UserId, "Unknown");
        end;
        if not (v31.name == v29.name) or v32.name ~= v30.name then
            l_sessionService_1:RemoveSessionsWithMetadataKey(l_SessionType_0.Metadata.GamePlay.DeleteOnGameLeave);
        end;
        if not (v31.detail == v29.detail) or v31.name ~= v29.name then
            if not l_sessionService_1:SessionExists(l_Level2a_1) then
                l_sessionService_1:SetSession(l_Level1_0, l_Level2a_1, v31.name);
            else
                l_sessionService_1:ReplaceSession(l_Level2a_1, v31.name);
            end;
            if v32.name == nil and v30.name == nil then
                l_sessionService_1:SetSession(l_Level2a_1, l_Level2b_1, v31.name .. "Page");
            end;
        end;
        if not (v32.detail == v30.detail) or v32.name ~= v30.name then
            if not l_sessionService_1:SessionExists(l_Level2b_1) then
                l_sessionService_1:SetSession(l_Level2a_1, l_Level2b_1, v32.name or v31.name .. "Page");
            else
                l_sessionService_1:ReplaceSession(l_Level2b_1, v32.name or v31.name .. "Page");
                return ;
            end;
        end;
    end;
    v24:setState({
        RNLevel2a = {
            name = v9.GetDefaultAppPage()
        }, 
        RNLevel2b = {}
    });
    v24._processRouteSignal = function(v37)
        local v38 = v22(v37) or {};
        v24:setState({
            RNLevel2a = v38[l_SessionType_0.StructuralIdentifier.Level2a], 
            RNLevel2b = v38[l_SessionType_0.StructuralIdentifier.Level2b] or {}
        });
    end;
end;
v23.render = function(_)
end;
v23.didMount = function(v40)
    v40.updateGameSearchSession();
    v40.updateSessionService(nil, nil, v40.state.RNLevel2a, v40.state.RNLevel2b);
    if not v40.props.connectRouteSignal then
        v6("Did not find a listener function in props, Session will not update");
        return ;
    else
        v40._routeChangedConnection = v40.props.connectRouteSignal(v40._processRouteSignal);
        return ;
    end;
end;
v23.didUpdate = function(v41, v42, v43)
    if (not v41.props.currentPage and "" or v41.props.currentPage.name) ~= if not not v42 and v42.currentPage then v42.currentPage.name else "" then
        v41.updateGameSearchSession();
    end;
    v41.updateSessionService(v43.RNLevel2a, v43.RNLevel2b, v41.state.RNLevel2a, v41.state.RNLevel2b);
    if v42.connectRouteSignal ~= v41.props.connectRouteSignal then
        if v41._routeChangedConnection ~= nil then
            v41._routeChangedConnection:disconnect();
            v41._routeChangedConnection = nil;
        end;
        if v41.props.connectRouteSignal then
            v41._routeChangedConnection = v41.props.connectRouteSignal(v41._processRouteSignal);
        end;
    end;
end;
v23.willUnmount = function(v44)
    if v44._routeChangedConnection ~= nil then
        v44._routeChangedConnection:disconnect();
        v44._routeChangedConnection = nil;
    end;
end;
return l_RoactServices_0.connect({
    sessionService = l_AppSessionService_0
})((v3.connect(function(v45, _)
    return {
        currentPage = l_selectCurrentLegacyPage_0(v45), 
        currentRoute = l_selectCurrentLegacyRoute_0(v45)
    };
end)(v23)));
