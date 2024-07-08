local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_withLocalization_0 = v1.withLocalization;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local v6 = require(l_Parent_0.Common.TextKeys);
local v7 = require(l_Parent_0.ContactsList.Components.ContactsInformationModal);
local v8 = l_Roact_0.PureComponent:extend("ContactsEmptyList");
v8.defaultProps = {
    errorTextKey = v6.EMPTY_STATE
};
v8.render = function(v9)
    local l_props_0 = v9.props;
    return l_withLocalization_0({
        emptyState = l_props_0.errorTextKey
    })(function(v11)
        return l_Roact_0.createElement(v7, {
            image = l_Images_0["icons/status/oof_xlarge"], 
            layoutOrder = l_props_0.layoutOrder, 
            text = v11.emptyState
        });
    end);
end;
return v8;
