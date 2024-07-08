local _ = require(game:GetService("CorePackages").Workspace.Packages.Style);
return function(_, v2)
    return {
        Color = {
            backgroundUiColor = v2.Semantic.Color.BackgroundUi.Default, 
            separatorColor = v2.Semantic.Color.Common.Divider, 
            textColor = v2.Semantic.Color.Text.Emphasis
        }, 
        Size = {
            displayWidth = 1920, 
            promptWidth = 1080, 
            imageWidth = 566, 
            imageHeight = 324, 
            buttonHeight = v2.Global.Size_600, 
            iconSize = v2.Global.Size_200
        }, 
        Space = {
            titlePadding = v2.Global.Space_150, 
            bodyPadding = v2.Global.Space_300, 
            iconPadding = v2.Global.Space_50
        }, 
        Radius = {
            cornerRadius = v2.Semantic.Radius.Medium
        }, 
        Typography = {
            label = v2.Semantic.Typography.Subheader, 
            header = v2.Semantic.Typography.Header, 
            caption = v2.Semantic.Typography.Body
        }
    };
end;
