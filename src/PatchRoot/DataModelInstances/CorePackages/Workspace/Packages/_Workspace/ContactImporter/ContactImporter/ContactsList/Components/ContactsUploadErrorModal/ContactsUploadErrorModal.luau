local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_withLocalization_0 = v1.withLocalization;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local v6 = require(l_Parent_0.Common.TextKeys);
local v7 = require(l_Parent_0.ContactsList.Components.ContactsInformationModal);
local v8 = l_Roact_0.PureComponent:extend("ContactsUploadErrorModal");
local v9 = require(l_Parent_0.Flags.getFFlagContactImporterErrorImage);
v8.render = function(_)
    return l_withLocalization_0({
        hasUploadError = v6.UPLOAD_CONTACTS_FAILURE
    })(function(v11)
        return l_Roact_0.createElement(v7, {
            image = if not v9() then l_Images_0["icons/status/alert"] else l_Images_0["icons/status/error_large"], 
            text = v11.hasUploadError
        });
    end);
end;
return v8;
