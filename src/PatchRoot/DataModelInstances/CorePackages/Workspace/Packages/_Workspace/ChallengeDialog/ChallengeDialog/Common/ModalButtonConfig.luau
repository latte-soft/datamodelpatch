return function(v0)
    local v1 = {};
    for _, v3 in pairs(v0) do
        table.insert(v1, {
            buttonType = v3.type, 
            props = {
                isDisabled = v3.isDisabled, 
                isLoading = v3.isLoading, 
                onActivated = v3.onActivated or function()
                end, 
                text = v3.text
            }
        });
    end;
    return {
        buttonHeight = 48, 
        buttons = v1
    };
end;
