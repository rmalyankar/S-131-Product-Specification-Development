-- Feature Catalogue Version: 2.0.0
-- Developed for S-131 by IIC

-- Harbour area section main entry point.
function HarbourAreaSection(feature, featurePortrayal, contextParameters)
    local viewingGroup = 32410

    -- =====================
    -- POINT
    -- =====================
    if feature.PrimitiveType == PrimitiveType.Point then
       featurePortrayal:AddInstructions(
                    'ViewingGroup:32410;DrawingPriority:12;DisplayPlane:UnderRADAR'
                )
            featurePortrayal:AddInstructions('PointInstruction:131SYMBL3S')

    -- =====================
    -- SURFACE
    -- =====================
    elseif feature.PrimitiveType == PrimitiveType.Surface then

        featurePortrayal:AddInstructions(
            'ViewingGroup:32410;DrawingPriority:6;DisplayPlane:UnderRADAR'
        )

        -- boundary portrayal
        if contextParameters.PlainBoundaries then
            featurePortrayal:SimpleLineStyle('dash', 0.64, 'CHGRD')
            featurePortrayal:AddInstructions('LineInstruction:_simple_')
        else
            featurePortrayal:AddInstructions('LineInstruction:HRBSEC01')
        end

        -- optional centroid symbol for area
        featurePortrayal:AddInstructions('PointInstruction:131INFRM')

    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    return viewingGroup
end

