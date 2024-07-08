local l_script_FirstAncestor_0 = script:FindFirstAncestor("TenFootUiGlobalNav");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.TenFootUiCommon);
local l_TenFootUiContext_0 = v4.TenFootUiContext;
local l_AppNotificationService_0 = require(l_Parent_0.RoactServiceTags).AppNotificationService;
local v7 = require(l_script_FirstAncestor_0.Analytics.makeGlobalNavAnalytics);
local l_GlobalNavDisplayOption_0 = v4.TenFootUiRNTypes.GlobalNavDisplayOption;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v10 = require(l_script_FirstAncestor_0.Components.GlobalNavContainer.useGlobalNavAnimation);
local l_getCurrentTabName_0 = require(l_Parent_0.NavigationRodux).Utils.getCurrentTabName;
local l_FFlagUnifyNavigationGraph_0 = require(l_Parent_0.SharedFlags).FFlagUnifyNavigationGraph;
return function(v13, v14)
    local v15 = v2.useContext(l_TenFootUiContext_0);
    assert(v15, "TenFootUiContext must be configured before using GlobalNav");
    local v16 = v15.useRoactService(l_AppNotificationService_0);
    local v17 = v7(v15.useRoactService(v15.RoactAnalytics), v15.buttonClick);
    local l_globalNavConfig_0 = v15.globalNavConfig;
    local l_state_0 = v13.state;
    local v20 = if not l_FFlagUnifyNavigationGraph_0 then l_state_0.routes[l_state_0.index].routeName else l_getCurrentTabName_0(l_state_0);
    local function v23(v21)
        local l_page_0 = v21.page;
        if v20 == l_page_0 then
            v15.LuaAppEvents.ReloadPage:fire(l_page_0);
            return ;
        else
            v13.navigate(l_page_0);
            if v21.actionType then
                v16:ActionTaken(v21.actionType);
            end;
            v17.ButtonActivated(l_page_0, v20);
            return ;
        end;
    end;
    local v25 = l_useLocalization_0((v3.List.map(l_globalNavConfig_0.tabs, function(v24)
        return v24.titleLocalizationKey;
    end)));
    local v27 = l_useLocalization_0((v3.List.map(l_globalNavConfig_0.options, function(v26)
        return v26.titleLocalizationKey;
    end)));
    local v28 = nil;
    local v29 = nil;
    local l_v10_0 = v10;
    local v31 = true;
    if v14 ~= l_GlobalNavDisplayOption_0.ShowAll then
        v31 = v14 == l_GlobalNavDisplayOption_0.TabGroupOnly;
    end;
    l_v10_0 = l_v10_0(v31);
    v31 = v10;
    local v32 = true;
    if v14 ~= l_GlobalNavDisplayOption_0.ShowAll then
        v32 = v14 == l_GlobalNavDisplayOption_0.OptionGroupOnly;
    end;
    v31 = v31(v32);
    if l_v10_0.isVisible then
        v28 = {
            selection = {
                (v3.List.findWhere(l_globalNavConfig_0.tabs, function(v33, _)
                    return v33.page == v20;
                end))
            }, 
            items = v3.List.map(l_globalNavConfig_0.tabs, function(v35, v36)
                return {
                    title = v25[v36], 
                    icon = v35.icon, 
                    iconComponent = v35.iconComponent, 
                    onActivated = function()
                        v23(v35);
                    end, 
                    showRoundedBackground = v20 == v35.page
                };
            end), 
            padding = {
                left = 0, 
                right = 0, 
                top = 0, 
                bottom = 0
            }
        };
    end;
    if v31.isVisible then
        v29 = {
            items = v3.List.map(l_globalNavConfig_0.options, function(v37, v38)
                return {
                    label = v27[v38], 
                    icon = v37.iconComponent or v37.icon, 
                    onActivated = function()
                        v23(v37);
                    end
                };
            end)
        };
    end;
    return {
        tabGroupProps = v28, 
        optionGroupProps = v29, 
        animationProps = {
            tabGroupTransparency = l_v10_0.transparency, 
            tabGroupRef = l_v10_0.ref, 
            optionGroupTransparency = v31.transparency, 
            optionGroupRef = v31.ref
        }
    };
end;
