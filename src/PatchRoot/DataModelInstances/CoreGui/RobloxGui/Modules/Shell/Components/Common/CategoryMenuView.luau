local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Roact);
local v2 = require(l_Modules_0.Shell.Utility);
local v3 = require(l_Modules_0.Shell.LocalizedStrings);
local v4 = require(l_Modules_0.Shell.Components.Common.VerticalListView);
local v5 = require(l_Modules_0.Shell.Components.Common.SelectorButton);
local v6 = require(l_Modules_0.Shell.Components.Common.RedirectComponent);
local v7 = v1.PureComponent:extend("CategoryMenuView");
v7.OnSelectSection = function(v8, v9)
    if v8.state.currentSectionKey ~= v9 then
        v8:setState({
            currentSectionKey = v9
        });
    end;
end;
v7.init = function(v10)
    v10.key = v10.props.StringKey;
    v10.defaultCategoryKey = v10.props.DefaultCategoryKey;
    v10.defaultCategoryFocus = v10.defaultCategoryKey or v10.props.DefaultCategoryFocus;
    v10.state = {
        currentSectionKey = v10.props.DefaultCategoryFocus
    };
    v10.getCurrentPageIndex = function()
        return v10.CurrentSection;
    end;
end;
v7.willUpdate = function(v11, v12, v13)
    v11.defaultCategoryKey = nil;
    if v11.props.InFocus == v12.InFocus then
        return ;
    else
        if v12.InFocus then
            v11.defaultCategoryKey = v13.currentSectionKey or v11.props.DefaultCategoryKey;
        end;
        return ;
    end;
end;
v7.render = function(v14)
    v14.categories = v14.props.Categories;
    local v15 = {};
    for v16 in pairs(v14.categories) do
        v15[v16] = v1.createElement(v5, {
            Size = UDim2.new(0, 360, 0, 80), 
            AnchorPoint = Vector2.new(0, 0), 
            Text = v3:LocalizedString(v14.categories[v16].StringKey), 
            ButtonKey = v16, 
            LayoutOrder = v14.categories[v16].Order, 
            Focused = v14.state.currentSectionKey == v16, 
            Selected = v14.defaultCategoryKey == v16, 
            OnSelectionGained = function(v17)
                v14:OnSelectSection(v17);
                if v14.props.OnSelectSection then
                    v14.props.OnSelectSection(v17);
                end;
            end, 
            OnSelectionLost = v14.props.OnLeaveSection, 
            OnActivated = v14.props.EnterSection
        });
    end;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        AnchorPoint = Vector2.new(0, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 1, 
        Selectable = false, 
        [v1.Ref] = function(v18)
            v14.ref = v18;
        end
    }, {
        NavObj = v1.createElement(v6, {
            ActionPriority = v14.props.ActionPriority, 
            StringKey = v14.key, 
            InFocus = v14.props.InFocus, 
            RedirectRight = v14.props.EnterSection, 
            RedirectUp = v14.props.RedirectUp, 
            RedirectDown = v14.props.RedirectDown
        }), 
        ButtonView = v1.createElement(v4, {
            PaddingTop = UDim.new(0.005, 0), 
            PaddingBottom = UDim.new(0.005, 0), 
            Spacing = UDim.new(0.025, 0), 
            ScrollBarThickness = 0, 
            Items = v15, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            ScrollingEnabled = false
        })
    });
end;
v7.didMount = function(v19)
    delay(0, function()
        if not (not v19.props.InFocus or not v19.ref) then
            v2.RemoveSelectionGroup(v19.key);
            v2.AddSelectionParent(v19.key, v19.ref);
        end;
    end);
end;
v7.didUpdate = function(v20, v21, _)
    if v20.props.InFocus == v21.InFocus then
        return ;
    elseif not v20.props.InFocus or not v20.ref then
        v2.RemoveSelectionGroup(v20.key);
        return ;
    else
        v2.RemoveSelectionGroup(v20.key);
        v2.AddSelectionParent(v20.key, v20.ref);
        return ;
    end;
end;
v7.willUnmount = function(v23)
    v2.RemoveSelectionGroup(v23.key);
end;
return v7;
