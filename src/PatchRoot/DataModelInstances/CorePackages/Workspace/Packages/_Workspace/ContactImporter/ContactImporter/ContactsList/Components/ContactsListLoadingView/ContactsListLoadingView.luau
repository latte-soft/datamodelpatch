local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_t_0 = v1.t;
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_withLocalization_0 = v1.withLocalization;
local l_FullPageModal_0 = l_UIBlox_0.App.Dialog.Modal.FullPageModal;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local v8 = require(l_Parent_0.Common.TextKeys);
local v9 = require(l_Parent_0.ContactsList.Components.ContactsGlimmer);
local v10 = l_Roact_0.PureComponent:extend("ContactsListLoadingView");
v10.validateProps = l_t_0.strictInterface({
    screenSize = l_t_0.Vector2
});
v10.render = function(v11)
    local l_screenSize_0 = v11.props.screenSize;
    return l_withLocalization_0({
        titleText = v8.CONTACTS_LIST_TITLE
    })(function(v13)
        return l_withStyle_0(function(_)
            return l_Roact_0.createElement(l_FullPageModal_0, {
                title = v13.titleText, 
                screenSize = l_screenSize_0
            }, {
                LoadingViewContainer = l_Roact_0.createElement("Frame", {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                }, {
                    UIListLayout = l_Roact_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 12), 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left
                    }), 
                    UIPadding = l_Roact_0.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 24), 
                        PaddingBottom = UDim.new(0, 36)
                    }), 
                    Glimmer1 = l_Roact_0.createElement(v9, {
                        layoutOrder = 1
                    }), 
                    Glimmer2 = l_Roact_0.createElement(v9, {
                        layoutOrder = 2
                    }), 
                    Glimmer3 = l_Roact_0.createElement(v9, {
                        layoutOrder = 3
                    })
                })
            });
        end);
    end);
end;
return v10;
