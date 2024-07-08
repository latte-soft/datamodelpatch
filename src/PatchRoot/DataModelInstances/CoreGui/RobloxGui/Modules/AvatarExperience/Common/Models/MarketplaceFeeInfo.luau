return {
    mock = function()
        return {
            taxRate = 0.3, 
            minimumFee = 1
        };
    end, 
    fromGetResaleTaxRate = function(v0)
        return {
            taxRate = v0.taxRate, 
            minimumFee = v0.minimumFee
        };
    end
};
