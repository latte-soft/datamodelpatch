local l_Parent_0 = script:FindFirstAncestor("TenFootUiControllerBar").Parent;
local v1 = require(l_Parent_0.Dev.Rodux);
local v2 = require(l_Parent_0.Dev.RoactRodux);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.ReactFocusNavigation);
local l_LocalizationProvider_0 = require(l_Parent_0.Localization).LocalizationProvider;
local l_makeMockLocalization_0 = require(l_Parent_0.Dev.TenFootUiTesting).TestHelpers.mocks.makeMockLocalization;
local function v10(v7)
    local v8 = v4.useFocusGuiObject();
    return v3.createElement("Frame", {
        ref = v4.useEventHandlerMap(v7.eventHandlerMap, (v4.useEventMap(v7.eventMap, (v3.useCallback(function(v9)
            if v9 then
                v8(v9, false);
            end;
        end, {
            v8
        })))))
    }, v7.children);
end;
return function(v11, v12)
    local v14 = v1.Store.new(function(v13)
        return v13;
    end, v12 or {});
    return function(v15)
        return v3.createElement(l_LocalizationProvider_0, {
            localization = l_makeMockLocalization_0()
        }, v3.createElement(v2.StoreProvider, {
            store = v14
        }, {
            InnerComponent = v3.createElement(v4.FocusNavigationContext.Provider, {
                value = v11.focusNavigation
            }, v3.createElement(v10, {
                eventMap = v11.eventMap or {}, 
                eventHandlerMap = v11.eventHandlerMap or {}
            }, v15.children))
        }));
    end;
end;
