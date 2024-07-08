local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_CorePackages_0.UIBlox);
local v4 = require(l_Modules_0.Common.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v6 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_withStyle_0 = v3.Style.withStyle;
local v8 = require(l_Modules_0.LuaApp.Constants);
local v9 = require(l_Modules_0.LuaApp.FitChildren);
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v11 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v12 = require(l_Modules_0.LuaApp.Enum.DevSubStatus);
local v13 = require(l_Modules_0.LuaApp.Thunks.DevSubs);
local v14 = require(l_Modules_0.LuaApp.AppPage);
local v15 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v16 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v17 = require(l_Modules_0.LuaApp.Components.More.DevSubGameList);
local v18 = require(l_Modules_0.LuaApp.Components.More.DevSubList);
local v19 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v20 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local l_GameIconReducer_0 = require(l_CorePackages_0.Workspace.Packages.GameIconRodux).GameIcons.GameIconReducer;
local function _(v22)
    return v22.status == v12.Active;
end;
local v24 = v2.Component:extend("DevSubsPage");
v24.init = function(v25)
    v25.onGameActivated = function(v26)
        v25.props.navigateDown({
            name = v14.DevSubs, 
            detail = v26.id
        });
    end;
    v25.onDevSubActivated = function(v27, v28, v29)
        v25.props.dispatchDevSubMoreMenuOverlay({
            anchorSpacePosition = v28, 
            anchorSpaceSize = v29, 
            devSub = v27
        });
    end;
end;
v24.render = function(v30)
    return l_withStyle_0(function(v31)
        local l_formFactor_0 = v30.props.formFactor;
        local l_devSubs_0 = v30.props.devSubs;
        local l_selectedGame_0 = v30.props.selectedGame;
        local v35 = l_formFactor_0 == l_FormFactor_0.WIDE;
        local v36 = {
            Layout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, 0)
            }), 
            UIPadding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, not not v35 and v8.MORE_PAGE_WIDE_PADDING_HORIZONTAL or 0), 
                PaddingRight = UDim.new(0, not not v35 and v8.MORE_PAGE_WIDE_PADDING_HORIZONTAL or 0), 
                PaddingTop = UDim.new(0, not not v35 and v8.MORE_PAGE_WIDE_PADDING_VERTICAL or v8.MORE_PAGE_SECTION_PADDING), 
                PaddingBottom = UDim.new(0, not not v35 and v8.MORE_PAGE_WIDE_PADDING_VERTICAL or v8.MORE_PAGE_SECTION_PADDING)
            })
        };
        local v37 = v30:getDevSubsByGameId(l_devSubs_0);
        local v38 = v30:getGamesById(l_devSubs_0);
        if not l_selectedGame_0 then
            v36.GameList = v2.createElement(v17, {
                games = v38, 
                subsByGameId = v37, 
                onGameActivated = v30.onGameActivated
            });
        else
            v36.SubList = v2.createElement(v18, {
                game = v38[l_selectedGame_0], 
                devSubs = v37[l_selectedGame_0], 
                onDevSubActivated = v30.onDevSubActivated
            });
        end;
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = v31.Theme.BackgroundDefault.Color, 
            BackgroundTransparency = v31.Theme.BackgroundDefault.Transparency
        }, {
            TopBarMorePage = v2.createElement(v16.Container, {
                leftItem = v16.BackButton, 
                rightItems = {
                    v16.BuyRobuxButton, 
                    v16.NotificationsButton
                }
            }), 
            PageContent = v2.createElement(v16.PageContent, {}, {
                Scroller = v2.createElement(v9.FitScrollingFrame, {
                    Position = UDim2.fromScale(0, 0), 
                    Size = UDim2.fromScale(1, 1), 
                    CanvasSize = UDim2.new(1, 0, 0, 0), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    ScrollBarThickness = 0, 
                    ClipsDescendants = false, 
                    fitFields = {
                        CanvasSize = v9.FitAxis.Height
                    }
                }, v36)
            })
        });
    end);
end;
v24.getDevSubsByGameId = function(_, v40)
    local v41 = {};
    for _, v43 in pairs(v40) do
        local l_gameId_0 = v43.gameId;
        if not v41[l_gameId_0] then
            v41[l_gameId_0] = {
                v43
            };
        else
            table.insert(v41[l_gameId_0], v43);
        end;
    end;
    return v41;
end;
v24.getGameIcon = function(v45, v46)
    v46 = tostring(v46);
    local l_gameIcons_0 = v45.props.gameIcons;
    if not l_gameIcons_0 or not l_gameIcons_0[v46] then
        return "";
    else
        return l_gameIcons_0[v46].url;
    end;
end;
v24.getGamesById = function(v48, v49)
    local v50 = {};
    for _, v52 in pairs(v49) do
        local v53 = v50[v52.gameId];
        local v54 = v52.status == v12.Active;
        if not v53 then
            v50[v52.gameId] = {
                name = v52.gameData.name, 
                icon = v48:getGameIcon(v52.gameId), 
                id = v52.gameId, 
                activeSubs = not v54 and 0 or 1
            };
        elseif v54 then
            v53.activeSubs = v53.activeSubs + 1;
        end;
    end;
    return v50;
end;
v24.didMount = function(v55)
    if v55.props.devSubsFetchingStatus == v11.NotStarted then
        v55.props.dispatchFetchDevSubs(v55.props.networking);
    end;
end;
return l_RoactServices_0.connect({
    networking = v6
})((v4.connect(function(v56, _)
    return {
        formFactor = v56.FormFactor, 
        devSubsFetchingStatus = v13.GetFetchingStatus(v56), 
        devSubs = v56.DevSubs, 
        gameIcons = v56[l_GameIconReducer_0.key]
    };
end, function(v58)
    return {
        dispatchFetchDevSubs = function(v59)
            return v58(v13.Fetch(v59));
        end, 
        navigateDown = function(...)
            return v58(v15(...));
        end, 
        dispatchDevSubMoreMenuOverlay = function(v60)
            return v58(v20(v19.DevSubMore, v60));
        end
    };
end)(v24)));
