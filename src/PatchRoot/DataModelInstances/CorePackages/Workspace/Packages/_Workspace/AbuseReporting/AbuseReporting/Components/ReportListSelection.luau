local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_useNavigator_0 = require(l_Parent_0.ServerUI).Hooks.useNavigator;
local v5 = require(l_script_FirstAncestor_0.Hooks.useAbuseReportingDesignTokens);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local _ = require(script.Parent.Parent.Common.Types);
local v8 = require(script.Parent.ReportStep);
local l_ScrollingListTable_0 = v3.App.Table.ScrollingListTable;
local l_CellTailDescription_0 = v3.App.Table.CellTailDescription;
local l_CellHeadDetail_0 = v3.App.Table.CellHeadDetail;
local l_Cell_0 = v3.App.Table.Cell;
local v13 = UDim2.new(1, 0, 0, 64);
return function(v14)
    local l_ReportListSelection_0 = v5().ReportListSelection;
    local v16 = {};
    local l_params_0 = v14.params;
    local v18 = l_useNavigator_0();
    if l_params_0.listItems then
        for v19, v20 in l_params_0.listItems, nil, nil do
            v16[v19] = v2.createElement(l_Cell_0, {
                size = l_ReportListSelection_0.listEntrySize or v13, 
                head = v2.createElement(l_CellHeadDetail_0, {
                    labelText = v20.humanReadableText
                }), 
                tail = v2.createElement(l_CellTailDescription_0, {
                    text = "", 
                    showArrow = true
                }), 
                background = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 1)
                }), 
                onActivated = function()
                    v14.onItemSelected(v14, v20);
                    if not v20.nextPage or not v20.nextPage.componentRefs then
                        if not v20.nextList then
                            if not (not l_params_0.nextPage or not l_params_0.nextPage.componentRefs) then
                                v18.push(l_params_0.nextPage.componentRefs);
                            end;
                            return ;
                        else
                            v18.pushParams(v20.nextList);
                            return ;
                        end;
                    else
                        v18.push(v20.nextPage.componentRefs);
                        return ;
                    end;
                end
            });
        end;
    end;
    local v21 = l_useLocalization_0({
        cancelText = "Feature.Chat.Action.Cancel", 
        skipText = "Feature.VerificationUpsell.Action.GenericSkip"
    });
    local v22 = {
        {
            text = v21.cancelText, 
            onActivated = function()
                v14.onCancel(v14);
            end
        }
    };
    if l_params_0.skippable then
        table.insert(v22, {
            text = v21.skipText, 
            onActivated = function()
                if not (not l_params_0.nextPage or not l_params_0.nextPage.componentRefs) then
                    v18.push(l_params_0.nextPage.componentRefs);
                end;
            end
        });
    end;
    return v2.createElement(v8, {
        title = l_params_0.heading, 
        buttons = v22
    }, {
        ListTable = v2.createElement(l_ScrollingListTable_0, {
            cells = v16, 
            selectable = false
        })
    });
end;
