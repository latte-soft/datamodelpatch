local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_ExperienceAuthService_0 = game:GetService("ExperienceAuthService");
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.RobloxTranslator);
local v8 = require(script.Parent.AvatarParts.AvatarPartGrid);
local l_Parent_0 = script.Parent.Parent;
local v10 = require(l_Parent_0.BasePublishPrompt);
local v11 = require(l_Parent_0.Common.ObjectViewport);
local v12 = UDim.new(0, 20);
local v13 = v4.PureComponent:extend("PublishAvatarPrompt");
v13.validateProps = v6.strictInterface({
    screenSize = v6.Vector2, 
    humanoidModel = v6.instanceOf("Model"), 
    guid = v6.any, 
    scopes = v6.any
});
v13.init = function(v14)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    assert(l_LocalPlayer_0, "Assert LocalPlayer is not nil to silence type checker");
    v14:setState({
        showingPreviewView = false, 
        name = l_LocalPlayer_0.Name .. "'s Body", 
        isNameValid = true
    });
    v14.openPreviewView = function()
        v14:setState({
            showingPreviewView = true
        });
    end;
    v14.closePreviewView = function()
        v14:setState({
            showingPreviewView = false
        });
    end;
    v14.canSubmit = function()
        return v14.state.isNameValid and v14.props.humanoidModel ~= nil;
    end;
    v14.onSubmit = function()
        l_ExperienceAuthService_0:ScopeCheckUIComplete(v14.props.guid, v14.props.scopes, Enum.ScopeCheckResult.ConsentAccepted, {
            avatarName = v14.state.name
        });
    end;
    v14.onNameUpdated = function(v16, v17)
        v14:setState({
            name = v16, 
            isNameValid = v17
        });
    end;
end;
v13.renderPromptBody = function(v18)
    local v19 = v18.props.humanoidModel == nil;
    return v4.createFragment({
        UIListLayout = v4.createElement("UIListLayout", {
            Padding = v12, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical
        }), 
        UIPadding = v4.createElement("UIPadding", {
            PaddingBottom = v12, 
            PaddingTop = v12
        }), 
        EmbeddedPreview = v4.createElement(v11, {
            openPreviewView = v18.openPreviewView, 
            model = v18.props.humanoidModel, 
            isLoading = v19, 
            useFullBodyCameraSettings = true, 
            fieldOfView = 30, 
            LayoutOrder = 1
        }), 
        AvatarPartGrid = if v19 then nil else v4.createElement(v8, {
            humanoidModel = v18.props.humanoidModel, 
            name = v18.state.name, 
            LayoutOrder = 2, 
            screenSize = v18.props.screenSize
        })
    });
end;
local function _()
    return {
        body = v7:FormatByKey("Feature.Catalog.Label.Body"), 
        title = "Submit Creation"
    };
end;
v13.render = function(v21)
    local v22 = {
        body = v7:FormatByKey("Feature.Catalog.Label.Body"), 
        title = "Submit Creation"
    };
    assert(l_Players_0, "Players should always be defined, silence type checker");
    return v4.createElement(v10, {
        promptBody = v21:renderPromptBody(), 
        screenSize = v21.props.screenSize, 
        showingPreviewView = v21.state.showingPreviewView, 
        closePreviewView = v21.closePreviewView, 
        asset = v21.props.humanoidModel, 
        nameLabel = "Body Name", 
        defaultName = v21.state.name, 
        typeData = v22.body, 
        titleText = v22.title, 
        onNameUpdated = v21.onNameUpdated, 
        canSubmit = v21.canSubmit, 
        onSubmit = v21.onSubmit, 
        enableInputDelayed = true, 
        isDelayedInput = true, 
        delayInputSeconds = 3
    });
end;
return v5.connect(function(v23)
    return {
        humanoidModel = v23.promptRequest.promptInfo.humanoidModel, 
        guid = v23.promptRequest.promptInfo.guid, 
        scopes = v23.promptRequest.promptInfo.scopes
    };
end)(v13);
