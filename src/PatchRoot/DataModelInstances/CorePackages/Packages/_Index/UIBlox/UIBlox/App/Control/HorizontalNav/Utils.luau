return {
    shouldShowGradientsForScrollingFrame = function(v0)
        local l_X_0 = v0.AbsoluteSize.X;
        local l_Offset_0 = v0.CanvasSize.X.Offset;
        local l_X_1 = v0.CanvasPosition.X;
        return l_X_0 < l_Offset_0, l_X_1 > 20, l_X_1 + l_X_0 < l_Offset_0 - 20;
    end
};
