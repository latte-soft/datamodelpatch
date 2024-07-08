local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local v5 = require(l_Modules_0.LuaApp.Constants);
local v6 = require(l_Modules_0.LuaApp.SearchUuid);
local v7 = require(l_Modules_0.LuaApp.Actions.SetSearchParameters);
local v8 = require(script.Parent.TenFootUiSearchTypeSelector);
local v9 = require(script.Parent.TenFootUiSearchBar);
local v10 = require(script.Parent.TenFootUiSearchExperiencesGrid);
local v11 = require(script.Parent.TenFootUiSearchPlayersGrid);
local l_FocusNavigationEventNameEnum_0 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum;
local v13 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v14 = require(l_CorePackages_0.Packages.InputHandlers);
local l_useNavigationProps_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppNavigation).useNavigationProps;
local v16 = game:DefineFastFlag("ConsolesSearchAutoKeyboard", false);
return function(_)
    local v18 = l_useDispatch_0();
    local v19 = l_useDesignTokens_0();
    local v20, v21 = v2.useState("");
    local v25, v26 = v2.useState((l_useNavigationProps_0(function(_, _, v24)
        return v24.getParam("defaultSearchType", v5.SearchTypes.Games);
    end)));
    local v27, v28 = v2.useState(v6());
    local v31 = v13.useEventHandlerMap(v2.useMemo(function()
        return {
            [l_FocusNavigationEventNameEnum_0.TabBackward] = {
                handler = v14.onRelease(function(_)
                    if v25 ~= v5.SearchTypes.Games then
                        v26(v5.SearchTypes.Games);
                    end;
                end)
            }, 
            [l_FocusNavigationEventNameEnum_0.TabForward] = {
                handler = v14.onRelease(function(_)
                    if v25 ~= v5.SearchTypes.Players then
                        v26(v5.SearchTypes.Players);
                    end;
                end)
            }
        };
    end, {
        v25, 
        v26
    }), (v13.useEventMap(v2.useMemo(function()
        return {
            [Enum.KeyCode.ButtonR1] = l_FocusNavigationEventNameEnum_0.TabForward, 
            [Enum.KeyCode.ButtonL1] = l_FocusNavigationEventNameEnum_0.TabBackward
        };
    end, {}), (v2.useRef(nil)))));
    v2.useEffect(function()
        v18(v7(v27, {
            isKeywordSuggestionEnabled = false, 
            searchKeyword = v20
        }));
    end, {
        v20, 
        v27
    });
    local function v33(v32)
        if v25 ~= v5.SearchTypes.Games and v25 ~= v5.SearchTypes.Players then
            warn("Invalid search type: " .. tostring(v32));
        end;
        if v32 == v25 then
            return ;
        else
            v26(v32);
            return ;
        end;
    end;
    local v34 = nil;
    if v16 then
        v34 = v2.createRef();
        v2.useEffect(function()
            if v34.current then
                v34.current:CaptureFocus();
            end;
        end, {});
    end;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        ZIndex = 2, 
        ref = v31, 
        BackgroundTransparency = v19.Semantic.Color.Common.Overlay.Transparency, 
        BackgroundColor3 = v19.Semantic.Color.Common.Overlay.Color3, 
        BorderSizePixel = 0
    }, {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Padding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v19.LuaApps.Search.SearchPaddingVertical), 
            PaddingRight = UDim.new(0, v19.LuaApps.Search.SearchPaddingVertical), 
            PaddingTop = UDim.new(0, v19.LuaApps.Search.SearchPaddingVertical)
        }), 
        SearchBox = v2.createElement(v9, {
            layoutOrder = 1, 
            textBoxRef = v34, 
            onFocused = function()
            end, 
            onSubmitSearch = function(v35)
                if v35.Text ~= v20 then
                    v28(v6());
                    v21(v35.Text);
                end;
            end
        }), 
        SearchTypeSelector = v2.createElement(v8, {
            layoutOrder = 2, 
            onSearchTypeSelected = v33, 
            searchType = v25
        }), 
        ExperiencesGrid = v2.createElement(v10, {
            layoutOrder = 3, 
            searchType = v25, 
            searchUuid = v27, 
            searchKeyword = v20
        }), 
        PlayersGrid = v2.createElement(v11, {
            layoutOrder = 4, 
            searchType = v25, 
            searchKeyword = v20
        })
    });
end;
