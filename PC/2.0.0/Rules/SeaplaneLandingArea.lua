-- Feature Catalogue Version: 2.0.0 (2025/10/25)
-- Modified for S-131 2.0.0 by IIC 20250107

-- Seaplane Landing Area main entry point.
function SeaplaneLandingArea(feature, featurePortrayal, contextParameters)
	local viewingGroup

	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		viewingGroup = 26040
		if contextParameters.RadarOverlay then
			featurePortrayal:AddInstructions('ViewingGroup:26040;DrawingPriority:12;DisplayPlane:OverRADAR')
		else
			featurePortrayal:AddInstructions('ViewingGroup:26040;DrawingPriority:12;DisplayPlane:UnderRADAR')
		end
		featurePortrayal:AddInstructions('PointInstruction:131SYMBL3S')
	elseif feature.PrimitiveType == PrimitiveType.Surface and contextParameters.PlainBoundaries then
		viewingGroup = 26040
		featurePortrayal:AddInstructions('ViewingGroup:26040;DrawingPriority:12;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('PointInstruction:131INFRM')
		featurePortrayal:SimpleLineStyle('dash',0.64,'CHGRD')
		featurePortrayal:AddInstructions('LineInstruction:_simple_')

	elseif feature.PrimitiveType == PrimitiveType.Surface then
		viewingGroup = 26040
		featurePortrayal:AddInstructions('ViewingGroup:26040;DrawingPriority:12;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('PointInstruction:131INFRM')
		featurePortrayal:AddInstructions('LineInstruction:CTYARE51')

	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
