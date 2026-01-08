-- Feature Catalogue Version: 1.0.0
-- Modified for S-131 2.0.0 by IIC 20250107

-- Waterway Area main entry point.
function WaterwayArea(feature, featurePortrayal, contextParameters)
	local viewingGroup

  if feature.PrimitiveType == PrimitiveType.Surface then
  	if contextParameters.PlainBoundaries then
  		viewingGroup = 32410
  		featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:6;DisplayPlane:UnderRADAR')
  		featurePortrayal:SimpleLineStyle('dash',0.64,'CHGRD')
  		featurePortrayal:AddInstructions('LineInstruction:_simple_')
  	else
  		viewingGroup = 32410
  		featurePortrayal:AddInstructions('ViewingGroup:32410;DrawingPriority:6;DisplayPlane:UnderRADAR')
      if feature.categoryOfPortSection then
        if contains(1, feature.categoryOfPortSection) then
          featurePortrayal:AddInstructions('PointInstruction:HRBSEC96C')
        elseif contains(3, feature.categoryOfPortSection) then
          featurePortrayal:AddInstructions('PointInstruction:HRBSEC97C')
        elseif contains(8, feature.categoryOfPortSection) then
          featurePortrayal:AddInstructions('PointInstruction:HRBSEC92C')
        elseif contains(9, feature.categoryOfPortSection) then
          featurePortrayal:AddInstructions('ColorFill:DEPVS')
		      featurePortrayal:AddInstructions('AreaFillReference:DRGARE01')
        elseif contains(11, feature.categoryOfPortSection) then
          featurePortrayal:AddInstructions('ColorFill:DEPVS')
          featurePortrayal:AddInstructions('PointInstruction:HRBSEC94C')
        elseif contains(12, feature.categoryOfPortSection) then
          featurePortrayal:AddInstructions('PointInstruction:HRBSEC95C')
        else
          featurePortrayal:AddInstructions('PointInstruction:CHINFO07')
        end
      else
        featurePortrayal:AddInstructions('PointInstruction:QUESMRK1')
      end
      -- if simple lines parameter not set, then use same line style for all area features
  		featurePortrayal:AddInstructions('LineInstruction:HRBSEC01')
    end
    -- end of portrayal for surface features
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
