local v0 = require(script.Parent.Parent.dependencies);
local l_React_0 = v0.React;
local l_UIBlox_0 = v0.UIBlox;
local l_Dash_0 = v0.Dash;
local l_ScrollingListTable_0 = l_UIBlox_0.App.Table.ScrollingListTable;
local l_ListTable_0 = l_UIBlox_0.App.Table.ListTable;
local v6 = require(script.Parent.AccountSelection);
local v7 = game:DefineFastFlag("DisableAccountSelectionListScrollingRelease2", false);
return function(v8)
    local function v10(v9)
        return l_React_0.createElement(v6, {
            user = v9, 
            onAccountSelection = v8.onAccountSelection, 
            isDisabled = v8.isDisabled
        });
    end;
    if v7 and not v8.isScrollable then
        return l_React_0.createElement(l_ListTable_0, {
            size = UDim2.new(1, 0, 0, v8.height), 
            showDividers = false, 
            cells = l_Dash_0.map(v8.users, v10)
        });
    else
        return l_React_0.createElement(l_ScrollingListTable_0, {
            size = UDim2.new(1, 0, 0, v8.height), 
            cells = l_Dash_0.map(v8.users, v10)
        });
    end;
end;
