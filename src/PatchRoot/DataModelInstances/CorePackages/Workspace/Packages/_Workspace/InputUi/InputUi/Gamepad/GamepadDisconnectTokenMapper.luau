local _ = require(script:FindFirstAncestor("InputUi").Parent.Style);
return function(_, _)
    return {
        designWidth = 1920, 
        imageWidth = 580, 
        imageHeight = 450, 
        textContainerWidth = 850, 
        horizontalInnerPadding = 78, 
        verticalPadding = 96
    };
end;
