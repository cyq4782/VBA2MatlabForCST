Component = invoke(mws, 'Component');
invoke(Component, 'New','BanZi');
Component = invoke(mws, 'Component');
invoke(Component, 'New','KuiDian');
Component = invoke(mws, 'Component');
invoke(Component, 'New','TianXian');
Component = invoke(mws, 'Component');
invoke(Component, 'New','ZhuZi');
Material = invoke(mws, 'Material');
invoke(Material, 'Reset');
invoke(Material, 'Name','Rogers RT5880 (lossy)');
invoke(Material, 'Folder','');
invoke(Material, 'FrqType','all');
invoke(Material, 'Type','Normal');
invoke(Material, 'SetMaterialUnit','GHz','mm');
invoke(Material, 'Epsilon','2.2');
invoke(Material, 'Mue','1.0');
invoke(Material, 'Kappa','0.0');
invoke(Material, 'TanD','0.0009');
invoke(Material, 'TanDFreq','10.0');
invoke(Material, 'TanDGiven','True');
invoke(Material, 'TanDModel','ConstTanD');
invoke(Material, 'KappaM','0.0');
invoke(Material, 'TanDM','0.0');
invoke(Material, 'TanDMFreq','0.0');
invoke(Material, 'TanDMGiven','False');
invoke(Material, 'TanDMModel','ConstKappa');
invoke(Material, 'DispModelEps','None');
invoke(Material, 'DispModelMue','None');
invoke(Material, 'DispersiveFittingSchemeEps','General 1st');
invoke(Material, 'DispersiveFittingSchemeMue','General 1st');
invoke(Material, 'UseGeneralDispersionEps','False');
invoke(Material, 'UseGeneralDispersionMue','False');
invoke(Material, 'Rho','0.0');
invoke(Material, 'ThermalType','Normal');
invoke(Material, 'ThermalConductivity','0.20');
invoke(Material, 'SetActiveMaterial','all');
invoke(Material, 'Colour','0.94','0.82','0.76');
invoke(Material, 'Wireframe','False');
invoke(Material, 'Transparency','0');
invoke(Material, 'Create');
Cylinder = invoke(mws, 'Cylinder');
invoke(Cylinder, 'Reset');
invoke(Cylinder, 'Name','JieZhiBan');
invoke(Cylinder, 'Component','BanZi');
invoke(Cylinder, 'Material','Rogers RT5880 (lossy)');
invoke(Cylinder, 'OuterRadius','RP');
invoke(Cylinder, 'InnerRadius','0');
invoke(Cylinder, 'Axis','z');
invoke(Cylinder, 'Zrange','0','h');
invoke(Cylinder, 'Xcenter','45');
invoke(Cylinder, 'Ycenter','45');
invoke(Cylinder, 'Segments','0');
invoke(Cylinder, 'Create');
Cylinder = invoke(mws, 'Cylinder');
invoke(Cylinder, 'Reset');
invoke(Cylinder, 'Name','Ground');
invoke(Cylinder, 'Component','BanZi');
invoke(Cylinder, 'Material','PEC');
invoke(Cylinder, 'OuterRadius','RP');
invoke(Cylinder, 'InnerRadius','0');
invoke(Cylinder, 'Axis','z');
invoke(Cylinder, 'Zrange','-0.2','0');
invoke(Cylinder, 'Xcenter','45');
invoke(Cylinder, 'Ycenter','45');
invoke(Cylinder, 'Segments','0');
invoke(Cylinder, 'Create');
Cylinder = invoke(mws, 'Cylinder');
invoke(Cylinder, 'Reset');
invoke(Cylinder, 'Name','up');
invoke(Cylinder, 'Component','BanZi');
invoke(Cylinder, 'Material','PEC');
invoke(Cylinder, 'OuterRadius','RP');
invoke(Cylinder, 'InnerRadius','0');
invoke(Cylinder, 'Axis','z');
invoke(Cylinder, 'Zrange','h','h+0.2');
invoke(Cylinder, 'Xcenter','45');
invoke(Cylinder, 'Ycenter','45');
invoke(Cylinder, 'Segments','0');
invoke(Cylinder, 'Create');
Cylinder = invoke(mws, 'Cylinder');
invoke(Cylinder, 'Reset');
invoke(Cylinder, 'Name','zhu_yuan');
invoke(Cylinder, 'Component','ZhuZi');
invoke(Cylinder, 'Material','PEC');
invoke(Cylinder, 'OuterRadius','zhu_r');
invoke(Cylinder, 'InnerRadius','0');
invoke(Cylinder, 'Axis','z');
invoke(Cylinder, 'Zrange','0','h');
invoke(Cylinder, 'Xcenter','45');
invoke(Cylinder, 'Ycenter','45');
invoke(Cylinder, 'Segments','0');
invoke(Cylinder, 'Create');
Transform = invoke(mws, 'Transform');
invoke(Transform, 'Reset');
invoke(Transform, 'Name','ZhuZi');
invoke(Transform, 'Vector','r','0','0');
invoke(Transform, 'UsePickedPoints','False');
invoke(Transform, 'InvertPickedPoints','False');
invoke(Transform, 'MultipleObjects','False');
invoke(Transform, 'GroupObjects','False');
invoke(Transform, 'Repetitions','1');
invoke(Transform, 'MultipleSelection','False');
invoke(Transform, 'Transform','Shape','Translate');
Transform = invoke(mws, 'Transform');
invoke(Transform, 'Reset');
invoke(Transform, 'Name','ZhuZi');
invoke(Transform, 'Origin','Free');
invoke(Transform, 'Center','45','45','0');
invoke(Transform, 'Angle','0','0','360/k');
invoke(Transform, 'MultipleObjects','True');
invoke(Transform, 'GroupObjects','True');
invoke(Transform, 'Repetitions','k');
invoke(Transform, 'MultipleSelection','False');
invoke(Transform, 'Destination','');
invoke(Transform, 'Material','');
invoke(Transform, 'Transform','Shape','Rotate');
Solid = invoke(mws, 'Solid');
invoke(Solid, 'Insert','BanZi:JieZhiBan','ZhuZi:zhu_yuan');
Cylinder = invoke(mws, 'Cylinder');
invoke(Cylinder, 'Reset');
invoke(Cylinder, 'Name','TongZhou_out');
invoke(Cylinder, 'Component','KuiDian');
invoke(Cylinder, 'Material','PEC');
invoke(Cylinder, 'OuterRadius','0.5');
invoke(Cylinder, 'InnerRadius','0.4');
invoke(Cylinder, 'Axis','z');
invoke(Cylinder, 'Zrange','-1.5','-0.2');
invoke(Cylinder, 'Xcenter','45+l');
invoke(Cylinder, 'Ycenter','45');
invoke(Cylinder, 'Segments','0');
invoke(Cylinder, 'Create');
Cylinder = invoke(mws, 'Cylinder');
invoke(Cylinder, 'Reset');
invoke(Cylinder, 'Name','TongZhou_in');
invoke(Cylinder, 'Component','KuiDian');
invoke(Cylinder, 'Material','PEC');
invoke(Cylinder, 'OuterRadius','r_in');
invoke(Cylinder, 'InnerRadius','0');
invoke(Cylinder, 'Axis','z');
invoke(Cylinder, 'Zrange','-1.5','hp');
invoke(Cylinder, 'Xcenter','45+l');
invoke(Cylinder, 'Ycenter','45');
invoke(Cylinder, 'Segments','0');
invoke(Cylinder, 'Create');
Cylinder = invoke(mws, 'Cylinder');
invoke(Cylinder, 'Reset');
invoke(Cylinder, 'Name','solid1');
invoke(Cylinder, 'Component','KuiDian');
invoke(Cylinder, 'Material','Vacuum');
invoke(Cylinder, 'OuterRadius','0.4');
invoke(Cylinder, 'InnerRadius','0');
invoke(Cylinder, 'Axis','z');
invoke(Cylinder, 'Zrange','-0.2','0');
invoke(Cylinder, 'Xcenter','45+l');
invoke(Cylinder, 'Ycenter','45');
invoke(Cylinder, 'Segments','0');
invoke(Cylinder, 'Create');
Transform = invoke(mws, 'Transform');
invoke(Transform, 'Reset');
invoke(Transform, 'Name','KuiDian');
invoke(Transform, 'Origin','Free');
invoke(Transform, 'Center','45','45','0');
invoke(Transform, 'Angle','0','0','xita');
invoke(Transform, 'MultipleObjects','True');
invoke(Transform, 'GroupObjects','False');
invoke(Transform, 'Repetitions','1');
invoke(Transform, 'MultipleSelection','False');
invoke(Transform, 'Destination','');
invoke(Transform, 'Material','');
invoke(Transform, 'Transform','Shape','Rotate');
Solid = invoke(mws, 'Solid');
invoke(Solid, 'Subtract','BanZi:Ground','KuiDian:solid1');
Solid = invoke(mws, 'Solid');
invoke(Solid, 'Subtract','BanZi:Ground','KuiDian:solid1_1');
Solid = invoke(mws, 'Solid');
invoke(Solid, 'Version','10');
invoke(Solid, 'Insert','BanZi:JieZhiBan','KuiDian:TongZhou_in');
invoke(Solid, 'Version','1');
Solid = invoke(mws, 'Solid');
invoke(Solid, 'Version','10');
invoke(Solid, 'Insert','BanZi:JieZhiBan','KuiDian:TongZhou_in_1');
invoke(Solid, 'Version','1');
Pick = invoke(mws, 'Pick');
invoke(Pick, 'PickEdgeFromId','KuiDian:TongZhou_out','1','1');
Port = invoke(mws, 'Port');
invoke(Port, 'Reset');
invoke(Port, 'PortNumber','1');
invoke(Port, 'Label','');
invoke(Port, 'NumberOfModes','1');
invoke(Port, 'AdjustPolarization','False');
invoke(Port, 'PolarizationAngle','0.0');
invoke(Port, 'ReferencePlaneDistance','0');
invoke(Port, 'TextSize','50');
invoke(Port, 'Coordinates','Picks');
invoke(Port, 'Orientation','positive');
invoke(Port, 'PortOnBound','False');
invoke(Port, 'ClipPickedPortToBound','False');
invoke(Port, 'Xrange','49.5','50.5');
invoke(Port, 'Yrange','44.5','45.5');
invoke(Port, 'Zrange','-1.5','-1.5');
invoke(Port, 'XrangeAdd','0.0','0.0');
invoke(Port, 'YrangeAdd','0.0','0.0');
invoke(Port, 'ZrangeAdd','0.0','0.0');
invoke(Port, 'SingleEnded','False');
invoke(Port, 'Create');
Pick = invoke(mws, 'Pick');
invoke(Pick, 'PickEdgeFromId','KuiDian:TongZhou_out_1','1','1');
Port = invoke(mws, 'Port');
invoke(Port, 'Reset');
invoke(Port, 'PortNumber','2');
invoke(Port, 'Label','');
invoke(Port, 'NumberOfModes','1');
invoke(Port, 'AdjustPolarization','False');
invoke(Port, 'PolarizationAngle','0.0');
invoke(Port, 'ReferencePlaneDistance','0');
invoke(Port, 'TextSize','50');
invoke(Port, 'Coordinates','Picks');
invoke(Port, 'Orientation','positive');
invoke(Port, 'PortOnBound','False');
invoke(Port, 'ClipPickedPortToBound','False');
invoke(Port, 'Xrange','44.5','45.5');
invoke(Port, 'Yrange','49.5','50.5');
invoke(Port, 'Zrange','-1.5','-1.5');
invoke(Port, 'XrangeAdd','0.0','0.0');
invoke(Port, 'YrangeAdd','0.0','0.0');
invoke(Port, 'ZrangeAdd','0.0','0.0');
invoke(Port, 'SingleEnded','False');
invoke(Port, 'Create');
Solver = invoke(mws, 'Solver');
invoke(Solver, 'ResetExcitationModes');
invoke(Solver, 'SimultaneousExcitation','True');
invoke(Solver, 'SetSimultaneousExcitAutoLabel','True');
invoke(Solver, 'SetSimultaneousExcitationLabel','1[1.0,0.0]+2[1.0,90],[10]');
invoke(Solver, 'SetSimultaneousExcitationOffset','Phaseshift');
invoke(Solver, 'PhaseRefFrequency','10');
invoke(Solver, 'ExcitationPortMode','1','1','1.0','0.0','default','True');
invoke(Solver, 'ExcitationPortMode','2','1','1.0','90','default','True');
Mesh = invoke(mws, 'Mesh');
invoke(Mesh, 'SetCreator','High Frequency');
Solver = invoke(mws, 'Solver');
invoke(Solver, 'Method','Hexahedral');
invoke(Solver, 'CalculationType','TD-S');
invoke(Solver, 'StimulationPort','All');
invoke(Solver, 'StimulationMode','All');
invoke(Solver, 'SteadyStateLimit','-30.0');
invoke(Solver, 'MeshAdaption','False');
invoke(Solver, 'AutoNormImpedance','False');
invoke(Solver, 'NormingImpedance','50');
invoke(Solver, 'CalculateModesOnly','False');
invoke(Solver, 'SParaSymmetry','False');
invoke(Solver, 'StoreTDResultsInCache','False');
invoke(Solver, 'FullDeembedding','False');
invoke(Solver, 'SuperimposePLWExcitation','False');
invoke(Solver, 'UseSensitivityAnalysis','False');
Solver = invoke(mws, 'Solver');
invoke(Solver, 'ResetExcitationModes');
invoke(Solver, 'SimultaneousExcitation','True');
invoke(Solver, 'SetSimultaneousExcitAutoLabel','True');
invoke(Solver, 'SetSimultaneousExcitationLabel','1[1.0,0.0]+2[1.0,90],[10]');
invoke(Solver, 'SetSimultaneousExcitationOffset','Phaseshift');
invoke(Solver, 'PhaseRefFrequency','10');
invoke(Solver, 'ExcitationPortMode','1','1','1.0','0.0','default','True');
invoke(Solver, 'ExcitationPortMode','2','1','1.0','90','default','True');
Mesh = invoke(mws, 'Mesh');
invoke(Mesh, 'SetCreator','High Frequency');
Solver = invoke(mws, 'Solver');
invoke(Solver, 'Method','Hexahedral');
invoke(Solver, 'CalculationType','TD-S');
invoke(Solver, 'StimulationPort','Selected');
invoke(Solver, 'StimulationMode','All');
invoke(Solver, 'SteadyStateLimit','-30.0');
invoke(Solver, 'MeshAdaption','False');
invoke(Solver, 'AutoNormImpedance','False');
invoke(Solver, 'NormingImpedance','50');
invoke(Solver, 'CalculateModesOnly','False');
invoke(Solver, 'SParaSymmetry','False');
invoke(Solver, 'StoreTDResultsInCache','False');
invoke(Solver, 'FullDeembedding','False');
invoke(Solver, 'SuperimposePLWExcitation','False');
invoke(Solver, 'UseSensitivityAnalysis','False');
Monitor = invoke(mws, 'Monitor');
invoke(Monitor, 'Delete','farfield (f=8)');
Monitor = invoke(mws, 'Monitor');
invoke(Monitor, 'Reset');
invoke(Monitor, 'Name','farfield (f=f)');
invoke(Monitor, 'Domain','Frequency');
invoke(Monitor, 'FieldType','Farfield');
invoke(Monitor, 'Frequency','f');
invoke(Monitor, 'UseSubvolume','False');
invoke(Monitor, 'ExportFarfieldSource','False');
invoke(Monitor, 'SetSubvolume','0.0','0.0','0.0','0.0','0.0','0.0');
invoke(Monitor, 'Create');
Monitor = invoke(mws, 'Monitor');
invoke(Monitor, 'Delete','e-field (f=8)');
Monitor = invoke(mws, 'Monitor');
invoke(Monitor, 'Reset');
invoke(Monitor, 'Name','e-field (f=f)');
invoke(Monitor, 'Dimension','Volume');
invoke(Monitor, 'Domain','Frequency');
invoke(Monitor, 'FieldType','Efield');
invoke(Monitor, 'Frequency','f');
invoke(Monitor, 'UseSubvolume','False');
invoke(Monitor, 'SetSubvolume','0.0','0.0','0.0','0.0','0.0','0.0');
invoke(Monitor, 'Create');
Monitor = invoke(mws, 'Monitor');
invoke(Monitor, 'Delete','h-field (f=8)');
Monitor = invoke(mws, 'Monitor');
invoke(Monitor, 'Reset');
invoke(Monitor, 'Name','h-field (f=f)');
invoke(Monitor, 'Dimension','Volume');
invoke(Monitor, 'Domain','Frequency');
invoke(Monitor, 'FieldType','Hfield');
invoke(Monitor, 'Frequency','f');
invoke(Monitor, 'UseSubvolume','False');
invoke(Monitor, 'SetSubvolume','0.0','0.0','0.0','0.0','0.0','0.0');
invoke(Monitor, 'Create');
Monitor = invoke(mws, 'Monitor');
invoke(Monitor, 'Delete','power (f=8)');
Monitor = invoke(mws, 'Monitor');
invoke(Monitor, 'Reset');
invoke(Monitor, 'Name','power (f=f)');
invoke(Monitor, 'Dimension','Volume');
invoke(Monitor, 'Domain','Frequency');
invoke(Monitor, 'FieldType','Powerflow');
invoke(Monitor, 'Frequency','f');
invoke(Monitor, 'Create');
Monitor = invoke(mws, 'Monitor');
invoke(Monitor, 'Delete','loss (f=8)');
Monitor = invoke(mws, 'Monitor');
invoke(Monitor, 'Reset');
invoke(Monitor, 'Name','loss (f=f)');
invoke(Monitor, 'Dimension','Volume');
invoke(Monitor, 'Domain','Frequency');
invoke(Monitor, 'FieldType','Powerloss');
invoke(Monitor, 'Frequency','f');
invoke(Monitor, 'Create');
Mesh = invoke(mws, 'Mesh');
invoke(Mesh, 'MeshType','PBA');
invoke(Mesh, 'SetCreator','High Frequency');
MeshSettings = invoke(mws, 'MeshSettings');
invoke(MeshSettings, 'SetMeshType','Hex');
invoke(MeshSettings, 'Set','Version',', 1');
invoke(MeshSettings, 'Set','StepsPerWaveNear','20');
invoke(MeshSettings, 'Set','StepsPerWaveFar','20');
invoke(MeshSettings, 'Set','WavelengthRefinementSameAsNear','1');
invoke(MeshSettings, 'Set','StepsPerBoxNear','20');
invoke(MeshSettings, 'Set','StepsPerBoxFar','1');
invoke(MeshSettings, 'Set','MaxStepNear','0');
invoke(MeshSettings, 'Set','MaxStepFar','0');
invoke(MeshSettings, 'Set','ModelBoxDescrNear','maxedge');
invoke(MeshSettings, 'Set','ModelBoxDescrFar','maxedge');
invoke(MeshSettings, 'Set','UseMaxStepAbsolute','0');
invoke(MeshSettings, 'Set','GeometryRefinementSameAsNear','0');
invoke(MeshSettings, 'Set','UseRatioLimitGeometry','1');
invoke(MeshSettings, 'Set','RatioLimitGeometry','20');
invoke(MeshSettings, 'Set','MinStepGeometryX','0');
invoke(MeshSettings, 'Set','MinStepGeometryY','0');
invoke(MeshSettings, 'Set','MinStepGeometryZ','0');
invoke(MeshSettings, 'Set','UseSameMinStepGeometryXYZ','1');
MeshSettings = invoke(mws, 'MeshSettings');
invoke(MeshSettings, 'SetMeshType','Hex');
invoke(MeshSettings, 'Set','FaceRefinementOn','0');
invoke(MeshSettings, 'Set','FaceRefinementPolicy','2');
invoke(MeshSettings, 'Set','FaceRefinementRatio','2');
invoke(MeshSettings, 'Set','FaceRefinementStep','0');
invoke(MeshSettings, 'Set','FaceRefinementNSteps','2');
invoke(MeshSettings, 'Set','EllipseRefinementOn','0');
invoke(MeshSettings, 'Set','EllipseRefinementPolicy','2');
invoke(MeshSettings, 'Set','EllipseRefinementRatio','2');
invoke(MeshSettings, 'Set','EllipseRefinementStep','0');
invoke(MeshSettings, 'Set','EllipseRefinementNSteps','2');
invoke(MeshSettings, 'Set','FaceRefinementBufferLines','3');
invoke(MeshSettings, 'Set','EdgeRefinementOn','1');
invoke(MeshSettings, 'Set','EdgeRefinementPolicy','1');
invoke(MeshSettings, 'Set','EdgeRefinementRatio','2');
invoke(MeshSettings, 'Set','EdgeRefinementStep','0');
invoke(MeshSettings, 'Set','EdgeRefinementBufferLines','3');
invoke(MeshSettings, 'Set','RefineEdgeMaterialGlobal','0');
invoke(MeshSettings, 'Set','RefineAxialEdgeGlobal','0');
invoke(MeshSettings, 'Set','BufferLinesNear','3');
invoke(MeshSettings, 'Set','UseDielectrics','1');
invoke(MeshSettings, 'Set','EquilibrateOn','0');
invoke(MeshSettings, 'Set','Equilibrate','1.5');
invoke(MeshSettings, 'Set','IgnoreThinPanelMaterial','0');
MeshSettings = invoke(mws, 'MeshSettings');
invoke(MeshSettings, 'SetMeshType','Hex');
invoke(MeshSettings, 'Set','SnapToAxialEdges','1');
invoke(MeshSettings, 'Set','SnapToPlanes','1');
invoke(MeshSettings, 'Set','SnapToSpheres','1');
invoke(MeshSettings, 'Set','SnapToEllipses','1');
invoke(MeshSettings, 'Set','SnapToCylinders','1');
invoke(MeshSettings, 'Set','SnapToCylinderCenters','1');
invoke(MeshSettings, 'Set','SnapToEllipseCenters','1');
Discretizer = invoke(mws, 'Discretizer');
invoke(Discretizer, 'MeshType','PBA');
invoke(Discretizer, 'PBAType','Fast PBA');
invoke(Discretizer, 'AutomaticPBAType','True');
invoke(Discretizer, 'FPBAAccuracyEnhancement','enable');
invoke(Discretizer, 'ConnectivityCheck','False');
invoke(Discretizer, 'ConvertGeometryDataAfterMeshing','True');
invoke(Discretizer, 'UsePecEdgeModel','True');
invoke(Discretizer, 'GapDetection','False');
invoke(Discretizer, 'FPBAGapTolerance','1e-3');
invoke(Discretizer, 'SetMaxParallelMesherThreads','Hex','12');
invoke(Discretizer, 'SetParallelMesherMode','Hex','None');
invoke(Discretizer, 'PointAccEnhancement','0');
invoke(Discretizer, 'UseSplitComponents','True');
invoke(Discretizer, 'EnableSubgridding','False');
invoke(Discretizer, 'PBAFillLimit','99');
invoke(Discretizer, 'AlwaysExcludePec','False');
FarfieldPlot = invoke(mws, 'FarfieldPlot');
invoke(FarfieldPlot, 'Plottype','Cartesian');
invoke(FarfieldPlot, 'Vary','angle2');
invoke(FarfieldPlot, 'Theta','30');
invoke(FarfieldPlot, 'Phi','30');
invoke(FarfieldPlot, 'Step','1');
invoke(FarfieldPlot, 'Step2','1');
invoke(FarfieldPlot, 'SetLockSteps','True');
invoke(FarfieldPlot, 'SetPlotRangeOnly','False');
invoke(FarfieldPlot, 'SetThetaStart','0');
invoke(FarfieldPlot, 'SetThetaEnd','180');
invoke(FarfieldPlot, 'SetPhiStart','0');
invoke(FarfieldPlot, 'SetPhiEnd','360');
invoke(FarfieldPlot, 'SetTheta360','False');
invoke(FarfieldPlot, 'SymmetricRange','False');
invoke(FarfieldPlot, 'SetTimeDomainFF','False');
invoke(FarfieldPlot, 'SetFrequency','-1');
invoke(FarfieldPlot, 'SetTime','0');
invoke(FarfieldPlot, 'SetColorByValue','True');
invoke(FarfieldPlot, 'DrawStepLines','False');
invoke(FarfieldPlot, 'DrawIsoLongitudeLatitudeLines','False');
invoke(FarfieldPlot, 'ShowStructure','False');
invoke(FarfieldPlot, 'SetStructureTransparent','False');
invoke(FarfieldPlot, 'SetFarfieldTransparent','False');
invoke(FarfieldPlot, 'SetSpecials','enablepolarextralines');
invoke(FarfieldPlot, 'SetPlotMode','Directivity');
invoke(FarfieldPlot, 'Distance','1');
invoke(FarfieldPlot, 'UseFarfieldApproximation','True');
invoke(FarfieldPlot, 'SetScaleLinear','False');
invoke(FarfieldPlot, 'SetLogRange','40');
invoke(FarfieldPlot, 'SetLogNorm','0');
invoke(FarfieldPlot, 'DBUnit','0');
invoke(FarfieldPlot, 'EnableFixPlotMaximum','False');
invoke(FarfieldPlot, 'SetFixPlotMaximumValue','1');
invoke(FarfieldPlot, 'SetInverseAxialRatio','False');
invoke(FarfieldPlot, 'SetAxesType','user');
invoke(FarfieldPlot, 'SetAntennaType','unknown');
invoke(FarfieldPlot, 'Phistart','1.000000e+000','0.000000e+000','0.000000e+000');
invoke(FarfieldPlot, 'Thetastart','0.000000e+000','0.000000e+000','1.000000e+000');
invoke(FarfieldPlot, 'PolarizationVector','0.000000e+000','1.000000e+000','0.000000e+000');
invoke(FarfieldPlot, 'SetCoordinateSystemType','spherical');
invoke(FarfieldPlot, 'SetAutomaticCoordinateSystem','True');
invoke(FarfieldPlot, 'SetPolarizationType','Linear');
invoke(FarfieldPlot, 'SlantAngle','0#');
invoke(FarfieldPlot, 'Origin','bbox');
invoke(FarfieldPlot, 'Userorigin','0.000000e+000','0.000000e+000','0.000000e+000');
invoke(FarfieldPlot, 'SetUserDecouplingPlane','False');
invoke(FarfieldPlot, 'UseDecouplingPlane','False');
invoke(FarfieldPlot, 'DecouplingPlaneAxis','X');
invoke(FarfieldPlot, 'DecouplingPlanePosition','0.000000e+000');
invoke(FarfieldPlot, 'LossyGround','False');
invoke(FarfieldPlot, 'GroundEpsilon','1');
invoke(FarfieldPlot, 'GroundKappa','0');
invoke(FarfieldPlot, 'EnablePhaseCenterCalculation','False');
invoke(FarfieldPlot, 'SetPhaseCenterAngularLimit','3.000000e+001');
invoke(FarfieldPlot, 'SetPhaseCenterComponent','boresight');
invoke(FarfieldPlot, 'SetPhaseCenterPlane','both');
invoke(FarfieldPlot, 'ShowPhaseCenter','True');
invoke(FarfieldPlot, 'StoreSettings');
Plot = invoke(mws, 'Plot');
invoke(Plot, 'DrawWorkplane','false');
Plot = invoke(mws, 'Plot');
invoke(Plot, 'DrawBox','False');
Plot = invoke(mws, 'Plot');
invoke(Plot, 'DrawWorkplane','true');
FarfieldPlot = invoke(mws, 'FarfieldPlot');
invoke(FarfieldPlot, 'Plottype','Polar');
invoke(FarfieldPlot, 'Vary','angle1');
invoke(FarfieldPlot, 'Theta','240');
invoke(FarfieldPlot, 'Phi','240');
invoke(FarfieldPlot, 'Step','1');
invoke(FarfieldPlot, 'Step2','1');
invoke(FarfieldPlot, 'SetLockSteps','True');
invoke(FarfieldPlot, 'SetPlotRangeOnly','False');
invoke(FarfieldPlot, 'SetThetaStart','0');
invoke(FarfieldPlot, 'SetThetaEnd','180');
invoke(FarfieldPlot, 'SetPhiStart','0');
invoke(FarfieldPlot, 'SetPhiEnd','360');
invoke(FarfieldPlot, 'SetTheta360','False');
invoke(FarfieldPlot, 'SymmetricRange','False');
invoke(FarfieldPlot, 'SetTimeDomainFF','False');
invoke(FarfieldPlot, 'SetFrequency','-1');
invoke(FarfieldPlot, 'SetTime','0');
invoke(FarfieldPlot, 'SetColorByValue','True');
invoke(FarfieldPlot, 'DrawStepLines','False');
invoke(FarfieldPlot, 'DrawIsoLongitudeLatitudeLines','False');
invoke(FarfieldPlot, 'ShowStructure','False');
invoke(FarfieldPlot, 'SetStructureTransparent','False');
invoke(FarfieldPlot, 'SetFarfieldTransparent','False');
invoke(FarfieldPlot, 'SetSpecials','enablepolarextralines');
invoke(FarfieldPlot, 'SetPlotMode','Directivity');
invoke(FarfieldPlot, 'Distance','1');
invoke(FarfieldPlot, 'UseFarfieldApproximation','True');
invoke(FarfieldPlot, 'SetScaleLinear','False');
invoke(FarfieldPlot, 'SetLogRange','40');
invoke(FarfieldPlot, 'SetLogNorm','0');
invoke(FarfieldPlot, 'DBUnit','0');
invoke(FarfieldPlot, 'EnableFixPlotMaximum','False');
invoke(FarfieldPlot, 'SetFixPlotMaximumValue','1');
invoke(FarfieldPlot, 'SetInverseAxialRatio','False');
invoke(FarfieldPlot, 'SetAxesType','user');
invoke(FarfieldPlot, 'SetAntennaType','unknown');
invoke(FarfieldPlot, 'Phistart','1.000000e+000','0.000000e+000','0.000000e+000');
invoke(FarfieldPlot, 'Thetastart','0.000000e+000','0.000000e+000','1.000000e+000');
invoke(FarfieldPlot, 'PolarizationVector','0.000000e+000','1.000000e+000','0.000000e+000');
invoke(FarfieldPlot, 'SetCoordinateSystemType','spherical');
invoke(FarfieldPlot, 'SetAutomaticCoordinateSystem','True');
invoke(FarfieldPlot, 'SetPolarizationType','Linear');
invoke(FarfieldPlot, 'SlantAngle','0#');
invoke(FarfieldPlot, 'Origin','bbox');
invoke(FarfieldPlot, 'Userorigin','0.000000e+000','0.000000e+000','0.000000e+000');
invoke(FarfieldPlot, 'SetUserDecouplingPlane','False');
invoke(FarfieldPlot, 'UseDecouplingPlane','False');
invoke(FarfieldPlot, 'DecouplingPlaneAxis','X');
invoke(FarfieldPlot, 'DecouplingPlanePosition','0.000000e+000');
invoke(FarfieldPlot, 'LossyGround','False');
invoke(FarfieldPlot, 'GroundEpsilon','1');
invoke(FarfieldPlot, 'GroundKappa','0');
invoke(FarfieldPlot, 'EnablePhaseCenterCalculation','False');
invoke(FarfieldPlot, 'SetPhaseCenterAngularLimit','3.000000e+001');
invoke(FarfieldPlot, 'SetPhaseCenterComponent','boresight');
invoke(FarfieldPlot, 'SetPhaseCenterPlane','both');
invoke(FarfieldPlot, 'ShowPhaseCenter','True');
invoke(FarfieldPlot, 'StoreSettings');
Monitor = invoke(mws, 'Monitor');
invoke(Monitor, 'Delete','farfield (f=10)');
Monitor = invoke(mws, 'Monitor');
invoke(Monitor, 'Delete','farfield (f=12)');
FarfieldPlot = invoke(mws, 'FarfieldPlot');
invoke(FarfieldPlot, 'Plottype','Polar');
invoke(FarfieldPlot, 'Vary','angle1');
invoke(FarfieldPlot, 'Theta','180');
invoke(FarfieldPlot, 'Phi','180');
invoke(FarfieldPlot, 'Step','1');
invoke(FarfieldPlot, 'Step2','1');
invoke(FarfieldPlot, 'SetLockSteps','True');
invoke(FarfieldPlot, 'SetPlotRangeOnly','False');
invoke(FarfieldPlot, 'SetThetaStart','0');
invoke(FarfieldPlot, 'SetThetaEnd','180');
invoke(FarfieldPlot, 'SetPhiStart','0');
invoke(FarfieldPlot, 'SetPhiEnd','360');
invoke(FarfieldPlot, 'SetTheta360','False');
invoke(FarfieldPlot, 'SymmetricRange','False');
invoke(FarfieldPlot, 'SetTimeDomainFF','False');
invoke(FarfieldPlot, 'SetFrequency','-1');
invoke(FarfieldPlot, 'SetTime','0');
invoke(FarfieldPlot, 'SetColorByValue','True');
invoke(FarfieldPlot, 'DrawStepLines','False');
invoke(FarfieldPlot, 'DrawIsoLongitudeLatitudeLines','False');
invoke(FarfieldPlot, 'ShowStructure','False');
invoke(FarfieldPlot, 'SetStructureTransparent','False');
invoke(FarfieldPlot, 'SetFarfieldTransparent','False');
invoke(FarfieldPlot, 'SetSpecials','enablepolarextralines');
invoke(FarfieldPlot, 'SetPlotMode','Gain');
invoke(FarfieldPlot, 'Distance','1');
invoke(FarfieldPlot, 'UseFarfieldApproximation','True');
invoke(FarfieldPlot, 'SetScaleLinear','False');
invoke(FarfieldPlot, 'SetLogRange','40');
invoke(FarfieldPlot, 'SetLogNorm','0');
invoke(FarfieldPlot, 'DBUnit','0');
invoke(FarfieldPlot, 'EnableFixPlotMaximum','False');
invoke(FarfieldPlot, 'SetFixPlotMaximumValue','1');
invoke(FarfieldPlot, 'SetInverseAxialRatio','False');
invoke(FarfieldPlot, 'SetAxesType','user');
invoke(FarfieldPlot, 'SetAntennaType','unknown');
invoke(FarfieldPlot, 'Phistart','1.000000e+000','0.000000e+000','0.000000e+000');
invoke(FarfieldPlot, 'Thetastart','0.000000e+000','0.000000e+000','1.000000e+000');
invoke(FarfieldPlot, 'PolarizationVector','0.000000e+000','1.000000e+000','0.000000e+000');
invoke(FarfieldPlot, 'SetCoordinateSystemType','spherical');
invoke(FarfieldPlot, 'SetAutomaticCoordinateSystem','True');
invoke(FarfieldPlot, 'SetPolarizationType','Linear');
invoke(FarfieldPlot, 'SlantAngle','0#');
invoke(FarfieldPlot, 'Origin','bbox');
invoke(FarfieldPlot, 'Userorigin','0.000000e+000','0.000000e+000','0.000000e+000');
invoke(FarfieldPlot, 'SetUserDecouplingPlane','False');
invoke(FarfieldPlot, 'UseDecouplingPlane','False');
invoke(FarfieldPlot, 'DecouplingPlaneAxis','X');
invoke(FarfieldPlot, 'DecouplingPlanePosition','0.000000e+000');
invoke(FarfieldPlot, 'LossyGround','False');
invoke(FarfieldPlot, 'GroundEpsilon','1');
invoke(FarfieldPlot, 'GroundKappa','0');
invoke(FarfieldPlot, 'EnablePhaseCenterCalculation','False');
invoke(FarfieldPlot, 'SetPhaseCenterAngularLimit','3.000000e+001');
invoke(FarfieldPlot, 'SetPhaseCenterComponent','boresight');
invoke(FarfieldPlot, 'SetPhaseCenterPlane','both');
invoke(FarfieldPlot, 'ShowPhaseCenter','True');
invoke(FarfieldPlot, 'StoreSettings');
Material = invoke(mws, 'Material');
invoke(Material, 'Reset');
invoke(Material, 'Name','Rogers RT6035HTC (loss free)');
invoke(Material, 'Folder','');
invoke(Material, 'FrqType','all');
invoke(Material, 'Type','Normal');
invoke(Material, 'SetMaterialUnit','GHz','mm');
invoke(Material, 'Epsilon','3.5');
invoke(Material, 'Mue','1.0');
invoke(Material, 'Kappa','0.0');
invoke(Material, 'TanD','0.0');
invoke(Material, 'TanDFreq','0.0');
invoke(Material, 'TanDGiven','False');
invoke(Material, 'TanDModel','ConstTanD');
invoke(Material, 'KappaM','0.0');
invoke(Material, 'TanDM','0.0');
invoke(Material, 'TanDMFreq','0.0');
invoke(Material, 'TanDMGiven','False');
invoke(Material, 'TanDMModel','ConstKappa');
invoke(Material, 'DispModelEps','None');
invoke(Material, 'DispModelMue','None');
invoke(Material, 'DispersiveFittingSchemeEps','General 1st');
invoke(Material, 'DispersiveFittingSchemeMue','General 1st');
invoke(Material, 'UseGeneralDispersionEps','False');
invoke(Material, 'UseGeneralDispersionMue','False');
invoke(Material, 'Rho','0.0');
invoke(Material, 'ThermalType','Normal');
invoke(Material, 'ThermalConductivity','0.60');
invoke(Material, 'SetActiveMaterial','all');
invoke(Material, 'Colour','0.75','0.95','0.85');
invoke(Material, 'Wireframe','False');
invoke(Material, 'Transparency','0');
invoke(Material, 'Create');
Solid = invoke(mws, 'Solid');
invoke(Solid, 'ChangeMaterial','BanZi:JieZhiBan','Rogers RT6035HTC (loss free)');
Cylinder = invoke(mws, 'Cylinder');
invoke(Cylinder, 'Reset');
invoke(Cylinder, 'Name','solid1');
invoke(Cylinder, 'Component','KuiDian');
invoke(Cylinder, 'Material','Vacuum');
invoke(Cylinder, 'OuterRadius','0.5');
invoke(Cylinder, 'InnerRadius','0');
invoke(Cylinder, 'Axis','z');
invoke(Cylinder, 'Zrange','-1','0');
invoke(Cylinder, 'Xcenter','45');
invoke(Cylinder, 'Ycenter','45');
invoke(Cylinder, 'Segments','0');
invoke(Cylinder, 'Create');
Transform = invoke(mws, 'Transform');
invoke(Transform, 'Reset');
invoke(Transform, 'Name','KuiDian:solid1');
invoke(Transform, 'Vector','0','-l','0');
invoke(Transform, 'UsePickedPoints','False');
invoke(Transform, 'InvertPickedPoints','False');
invoke(Transform, 'MultipleObjects','False');
invoke(Transform, 'GroupObjects','False');
invoke(Transform, 'Repetitions','1');
invoke(Transform, 'MultipleSelection','False');
invoke(Transform, 'Transform','Shape','Translate');
Transform = invoke(mws, 'Transform');
invoke(Transform, 'Reset');
invoke(Transform, 'Name','KuiDian:solid1');
invoke(Transform, 'Origin','Free');
invoke(Transform, 'Center','45','45','0');
invoke(Transform, 'Angle','0','0','-90');
invoke(Transform, 'MultipleObjects','True');
invoke(Transform, 'GroupObjects','False');
invoke(Transform, 'Repetitions','1');
invoke(Transform, 'MultipleSelection','False');
invoke(Transform, 'Destination','');
invoke(Transform, 'Material','');
invoke(Transform, 'Transform','Shape','Rotate');
Solid = invoke(mws, 'Solid');
invoke(Solid, 'Subtract','BanZi:Ground','KuiDian:solid1');
Solid = invoke(mws, 'Solid');
invoke(Solid, 'Subtract','BanZi:Ground','KuiDian:solid1_1');
Transform = invoke(mws, 'Transform');
invoke(Transform, 'Reset');
invoke(Transform, 'Name','KuiDian');
invoke(Transform, 'Origin','Free');
invoke(Transform, 'Center','45','45','0');
invoke(Transform, 'Angle','0','0','180');
invoke(Transform, 'MultipleObjects','True');
invoke(Transform, 'GroupObjects','False');
invoke(Transform, 'Repetitions','1');
invoke(Transform, 'MultipleSelection','False');
invoke(Transform, 'Destination','');
invoke(Transform, 'Material','');
invoke(Transform, 'Transform','Shape','Rotate');
Pick = invoke(mws, 'Pick');
invoke(Pick, 'PickEdgeFromId','KuiDian:TongZhou_out_2','1','1');
Port = invoke(mws, 'Port');
invoke(Port, 'Reset');
invoke(Port, 'PortNumber','3');
invoke(Port, 'Label','');
invoke(Port, 'NumberOfModes','1');
invoke(Port, 'AdjustPolarization','False');
invoke(Port, 'PolarizationAngle','0.0');
invoke(Port, 'ReferencePlaneDistance','0');
invoke(Port, 'TextSize','50');
invoke(Port, 'Coordinates','Picks');
invoke(Port, 'Orientation','positive');
invoke(Port, 'PortOnBound','False');
invoke(Port, 'ClipPickedPortToBound','False');
invoke(Port, 'Xrange','34','35');
invoke(Port, 'Yrange','44.5','45.5');
invoke(Port, 'Zrange','-1.5','-1.5');
invoke(Port, 'XrangeAdd','0.0','0.0');
invoke(Port, 'YrangeAdd','0.0','0.0');
invoke(Port, 'ZrangeAdd','0.0','0.0');
invoke(Port, 'SingleEnded','False');
invoke(Port, 'Create');
Pick = invoke(mws, 'Pick');
invoke(Pick, 'PickEdgeFromId','KuiDian:TongZhou_out_1_1','1','1');
Port = invoke(mws, 'Port');
invoke(Port, 'Reset');
invoke(Port, 'PortNumber','4');
invoke(Port, 'Label','');
invoke(Port, 'NumberOfModes','1');
invoke(Port, 'AdjustPolarization','False');
invoke(Port, 'PolarizationAngle','0.0');
invoke(Port, 'ReferencePlaneDistance','0');
invoke(Port, 'TextSize','50');
invoke(Port, 'Coordinates','Picks');
invoke(Port, 'Orientation','positive');
invoke(Port, 'PortOnBound','False');
invoke(Port, 'ClipPickedPortToBound','False');
invoke(Port, 'Xrange','44.5','45.5');
invoke(Port, 'Yrange','34','35');
invoke(Port, 'Zrange','-1.5','-1.5');
invoke(Port, 'XrangeAdd','0.0','0.0');
invoke(Port, 'YrangeAdd','0.0','0.0');
invoke(Port, 'ZrangeAdd','0.0','0.0');
invoke(Port, 'SingleEnded','False');
invoke(Port, 'Create');
Solver = invoke(mws, 'Solver');
invoke(Solver, 'ResetExcitationModes');
invoke(Solver, 'SimultaneousExcitation','True');
invoke(Solver, 'SetSimultaneousExcitAutoLabel','True');
invoke(Solver, 'SetSimultaneousExcitationLabel','1[1.0,0.0]+2[1.0,90]+3[1.0,180]+4[1.0,270],[10]');
invoke(Solver, 'SetSimultaneousExcitationOffset','Phaseshift');
invoke(Solver, 'PhaseRefFrequency','10');
invoke(Solver, 'ExcitationPortMode','1','1','1.0','0.0','default','True');
invoke(Solver, 'ExcitationPortMode','2','1','1.0','90','default','True');
invoke(Solver, 'ExcitationPortMode','3','1','1.0','180','default','True');
invoke(Solver, 'ExcitationPortMode','4','1','1.0','270','default','True');
FarfieldPlot = invoke(mws, 'FarfieldPlot');
invoke(FarfieldPlot, 'Plottype','3D');
invoke(FarfieldPlot, 'Vary','angle1');
invoke(FarfieldPlot, 'Theta','180');
invoke(FarfieldPlot, 'Phi','180');
invoke(FarfieldPlot, 'Step','5');
invoke(FarfieldPlot, 'Step2','5');
invoke(FarfieldPlot, 'SetLockSteps','True');
invoke(FarfieldPlot, 'SetPlotRangeOnly','False');
invoke(FarfieldPlot, 'SetThetaStart','0');
invoke(FarfieldPlot, 'SetThetaEnd','180');
invoke(FarfieldPlot, 'SetPhiStart','0');
invoke(FarfieldPlot, 'SetPhiEnd','360');
invoke(FarfieldPlot, 'SetTheta360','False');
invoke(FarfieldPlot, 'SymmetricRange','False');
invoke(FarfieldPlot, 'SetTimeDomainFF','False');
invoke(FarfieldPlot, 'SetFrequency','-1');
invoke(FarfieldPlot, 'SetTime','0');
invoke(FarfieldPlot, 'SetColorByValue','True');
invoke(FarfieldPlot, 'DrawStepLines','False');
invoke(FarfieldPlot, 'DrawIsoLongitudeLatitudeLines','False');
invoke(FarfieldPlot, 'ShowStructure','False');
invoke(FarfieldPlot, 'SetStructureTransparent','False');
invoke(FarfieldPlot, 'SetFarfieldTransparent','False');
invoke(FarfieldPlot, 'SetSpecials','enablepolarextralines');
invoke(FarfieldPlot, 'SetPlotMode','Gain');
invoke(FarfieldPlot, 'Distance','1');
invoke(FarfieldPlot, 'UseFarfieldApproximation','True');
invoke(FarfieldPlot, 'SetScaleLinear','False');
invoke(FarfieldPlot, 'SetLogRange','40');
invoke(FarfieldPlot, 'SetLogNorm','0');
invoke(FarfieldPlot, 'DBUnit','0');
invoke(FarfieldPlot, 'EnableFixPlotMaximum','False');
invoke(FarfieldPlot, 'SetFixPlotMaximumValue','1');
invoke(FarfieldPlot, 'SetInverseAxialRatio','False');
invoke(FarfieldPlot, 'SetAxesType','user');
invoke(FarfieldPlot, 'SetAntennaType','unknown');
invoke(FarfieldPlot, 'Phistart','1.000000e+000','0.000000e+000','0.000000e+000');
invoke(FarfieldPlot, 'Thetastart','0.000000e+000','0.000000e+000','1.000000e+000');
invoke(FarfieldPlot, 'PolarizationVector','0.000000e+000','1.000000e+000','0.000000e+000');
invoke(FarfieldPlot, 'SetCoordinateSystemType','spherical');
invoke(FarfieldPlot, 'SetAutomaticCoordinateSystem','True');
invoke(FarfieldPlot, 'SetPolarizationType','Linear');
invoke(FarfieldPlot, 'SlantAngle','0#');
invoke(FarfieldPlot, 'Origin','bbox');
invoke(FarfieldPlot, 'Userorigin','0.000000e+000','0.000000e+000','0.000000e+000');
invoke(FarfieldPlot, 'SetUserDecouplingPlane','False');
invoke(FarfieldPlot, 'UseDecouplingPlane','False');
invoke(FarfieldPlot, 'DecouplingPlaneAxis','X');
invoke(FarfieldPlot, 'DecouplingPlanePosition','0.000000e+000');
invoke(FarfieldPlot, 'LossyGround','False');
invoke(FarfieldPlot, 'GroundEpsilon','1');
invoke(FarfieldPlot, 'GroundKappa','0');
invoke(FarfieldPlot, 'EnablePhaseCenterCalculation','False');
invoke(FarfieldPlot, 'SetPhaseCenterAngularLimit','3.000000e+001');
invoke(FarfieldPlot, 'SetPhaseCenterComponent','boresight');
invoke(FarfieldPlot, 'SetPhaseCenterPlane','both');
invoke(FarfieldPlot, 'ShowPhaseCenter','True');
invoke(FarfieldPlot, 'StoreSettings');
ParameterSweep = invoke(mws, 'ParameterSweep');
invoke(ParameterSweep, 'SetSimulationType','Transient');
ParameterSweep = invoke(mws, 'ParameterSweep');
invoke(ParameterSweep, 'AddSequence','Sequence 1');
ParameterSweep = invoke(mws, 'ParameterSweep');
invoke(ParameterSweep, 'AddParameter_Stepwidth','Sequence 1','a','2.5','4.5','0.5');
Solid = invoke(mws, 'Solid');
invoke(Solid, 'ChangeMaterial','BanZi:JieZhiBan','Rogers RT5880 (lossy)');
FarfieldPlot = invoke(mws, 'FarfieldPlot');
invoke(FarfieldPlot, 'Plottype','3D');
invoke(FarfieldPlot, 'Vary','angle2');
invoke(FarfieldPlot, 'Theta','0');
invoke(FarfieldPlot, 'Phi','0');
invoke(FarfieldPlot, 'Step','5');
invoke(FarfieldPlot, 'Step2','5');
invoke(FarfieldPlot, 'SetLockSteps','True');
invoke(FarfieldPlot, 'SetPlotRangeOnly','False');
invoke(FarfieldPlot, 'SetThetaStart','0');
invoke(FarfieldPlot, 'SetThetaEnd','180');
invoke(FarfieldPlot, 'SetPhiStart','0');
invoke(FarfieldPlot, 'SetPhiEnd','360');
invoke(FarfieldPlot, 'SetTheta360','False');
invoke(FarfieldPlot, 'SymmetricRange','False');
invoke(FarfieldPlot, 'SetTimeDomainFF','False');
invoke(FarfieldPlot, 'SetFrequency','-1');
invoke(FarfieldPlot, 'SetTime','0');
invoke(FarfieldPlot, 'SetColorByValue','True');
invoke(FarfieldPlot, 'DrawStepLines','False');
invoke(FarfieldPlot, 'DrawIsoLongitudeLatitudeLines','False');
invoke(FarfieldPlot, 'ShowStructure','False');
invoke(FarfieldPlot, 'SetStructureTransparent','False');
invoke(FarfieldPlot, 'SetFarfieldTransparent','False');
invoke(FarfieldPlot, 'SetSpecials','enablepolarextralines');
invoke(FarfieldPlot, 'SetPlotMode','Gain');
invoke(FarfieldPlot, 'Distance','1');
invoke(FarfieldPlot, 'UseFarfieldApproximation','True');
invoke(FarfieldPlot, 'SetScaleLinear','False');
invoke(FarfieldPlot, 'SetLogRange','40');
invoke(FarfieldPlot, 'SetLogNorm','0');
invoke(FarfieldPlot, 'DBUnit','0');
invoke(FarfieldPlot, 'EnableFixPlotMaximum','False');
invoke(FarfieldPlot, 'SetFixPlotMaximumValue','1');
invoke(FarfieldPlot, 'SetInverseAxialRatio','False');
invoke(FarfieldPlot, 'SetAxesType','user');
invoke(FarfieldPlot, 'SetAntennaType','unknown');
invoke(FarfieldPlot, 'Phistart','1.000000e+000','0.000000e+000','0.000000e+000');
invoke(FarfieldPlot, 'Thetastart','0.000000e+000','0.000000e+000','1.000000e+000');
invoke(FarfieldPlot, 'PolarizationVector','0.000000e+000','1.000000e+000','0.000000e+000');
invoke(FarfieldPlot, 'SetCoordinateSystemType','spherical');
invoke(FarfieldPlot, 'SetAutomaticCoordinateSystem','True');
invoke(FarfieldPlot, 'SetPolarizationType','Linear');
invoke(FarfieldPlot, 'SlantAngle','0#');
invoke(FarfieldPlot, 'Origin','bbox');
invoke(FarfieldPlot, 'Userorigin','0.000000e+000','0.000000e+000','0.000000e+000');
invoke(FarfieldPlot, 'SetUserDecouplingPlane','False');
invoke(FarfieldPlot, 'UseDecouplingPlane','False');
invoke(FarfieldPlot, 'DecouplingPlaneAxis','X');
invoke(FarfieldPlot, 'DecouplingPlanePosition','0.000000e+000');
invoke(FarfieldPlot, 'LossyGround','False');
invoke(FarfieldPlot, 'GroundEpsilon','1');
invoke(FarfieldPlot, 'GroundKappa','0');
invoke(FarfieldPlot, 'EnablePhaseCenterCalculation','False');
invoke(FarfieldPlot, 'SetPhaseCenterAngularLimit','3.000000e+001');
invoke(FarfieldPlot, 'SetPhaseCenterComponent','boresight');
invoke(FarfieldPlot, 'SetPhaseCenterPlane','both');
invoke(FarfieldPlot, 'ShowPhaseCenter','True');
invoke(FarfieldPlot, 'StoreSettings');
