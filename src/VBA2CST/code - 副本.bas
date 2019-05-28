'@ use template: Antenna - Waveguide_8

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
'set the units
With Units
    .Geometry "mm"
    .Frequency "GHz"
    .Voltage "V"
    .Resistance "Ohm"
    .Inductance "NanoH"
    .TemperatureUnit "Kelvin"
    .Time "ns"
    .Current "A"
    .Conductance "Siemens"
    .Capacitance "PikoF"
End With
'----------------------------------------------------------------------------
Plot.DrawBox True
With Background
     .Type "Normal"
     .Epsilon "1.0"
     .Mue "1.0"
     .XminSpace "0.0"
     .XmaxSpace "0.0"
     .YminSpace "0.0"
     .YmaxSpace "0.0"
     .ZminSpace "0.0"
     .ZmaxSpace "0.0"
End With
With Boundary
     .Xmin "expanded open"
     .Xmax "expanded open"
     .Ymin "expanded open"
     .Ymax "expanded open"
     .Zmin "expanded open"
     .Zmax "expanded open"
     .Xsymmetry "none"
     .Ysymmetry "none"
     .Zsymmetry "none"
End With
' switch on FD-TET setting for accurate farfields
FDSolver.ExtrudeOpenBC "True"
Mesh.FPBAAvoidNonRegUnite "True"
Mesh.ConsiderSpaceForLowerMeshLimit "False"
Mesh.MinimumStepNumber "5"
With MeshSettings
     .SetMeshType "Hex"
     .Set "RatioLimitGeometry", "20"
End With
With MeshSettings
     .SetMeshType "HexTLM"
     .Set "RatioLimitGeometry", "20"
End With
PostProcess1D.ActivateOperation "vswr", "true"
PostProcess1D.ActivateOperation "yz-matrices", "true"
'----------------------------------------------------------------------------
'set the frequency range
Solver.FrequencyRange "8", "12"
Dim sDefineAt As String
sDefineAt = "8;10;12"
Dim sDefineAtName As String
sDefineAtName = "8;10;12"
Dim sDefineAtToken As String
sDefineAtToken = "f="
Dim aFreq() As String
aFreq = Split(sDefineAt, ";")
Dim aNames() As String
aNames = Split(sDefineAtName, ";")
Dim nIndex As Integer
For nIndex = LBound(aFreq) To UBound(aFreq)
Dim zz_val As String
zz_val = aFreq(nIndex)
Dim zz_name As String
zz_name = sDefineAtToken & aNames(nIndex)
' Define E-Field Monitors
With Monitor
    .Reset
    .Name "e-field (" & zz_name & ")"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Efield"
    .Frequency zz_val
    .Create
End With
' Define H-Field Monitors
With Monitor
    .Reset
    .Name "h-field (" & zz_name & ")"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Hfield"
    .Frequency zz_val
    .Create
End With
' Define Power flow Monitors
With Monitor
    .Reset
    .Name "power (" & zz_name & ")"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Powerflow"
    .Frequency zz_val
    .Create
End With
' Define Power loss Monitors
With Monitor
    .Reset
    .Name "loss (" & zz_name & ")"
    .Dimension "Volume"
    .Domain "Frequency"
    .FieldType "Powerloss"
    .Frequency zz_val
    .Create
End With
' Define Farfield Monitors
With Monitor
    .Reset
    .Name "farfield (" & zz_name & ")"
    .Domain "Frequency"
    .FieldType "Farfield"
    .Frequency zz_val
    .ExportFarfieldSource "False"
    .Create
End With
Next
'----------------------------------------------------------------------------
With MeshSettings
     .SetMeshType "Hex"
     .Set "Version", 1
End With
With Mesh
     .MeshType "PBA"
End With
'set the solver type
ChangeSolverType ("HF Time Domain")

'@ new component: BanZi

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
Component.New "BanZi"

'@ new component: KuiDian

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
Component.New "KuiDian"

'@ new component: TianXian

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
Component.New "TianXian"

'@ new component: ZhuZi

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
Component.New "ZhuZi"

'@ define material: Rogers RT5880 (lossy)

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
With Material
     .Reset
     .Name "Rogers RT5880 (lossy)"
     .Folder ""
.FrqType "all"
.Type "Normal"
.SetMaterialUnit "GHz", "mm"
.Epsilon "2.2"
.Mue "1.0"
.Kappa "0.0"
.TanD "0.0009"
.TanDFreq "10.0"
.TanDGiven "True"
.TanDModel "ConstTanD"
.KappaM "0.0"
.TanDM "0.0"
.TanDMFreq "0.0"
.TanDMGiven "False"
.TanDMModel "ConstKappa"
.DispModelEps "None"
.DispModelMue "None"
.DispersiveFittingSchemeEps "General 1st"
.DispersiveFittingSchemeMue "General 1st"
.UseGeneralDispersionEps "False"
.UseGeneralDispersionMue "False"
.Rho "0.0"
.ThermalType "Normal"
.ThermalConductivity "0.20"
.SetActiveMaterial "all"
.Colour "0.94", "0.82", "0.76"
.Wireframe "False"
.Transparency "0"
.Create
End With

'@ define cylinder: BanZi:JieZhiBan

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
With Cylinder
     .Reset
     .Name "JieZhiBan"
     .Component "BanZi"
     .Material "Rogers RT5880 (lossy)"
     .OuterRadius "RP"
     .InnerRadius "0"
     .Axis "z"
     .Zrange "0", "h"
     .Xcenter "45"
     .Ycenter "45"
     .Segments "0"
     .Create
End With

'@ define cylinder: BanZi:Ground

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
With Cylinder
     .Reset
     .Name "Ground"
     .Component "BanZi"
     .Material "PEC"
     .OuterRadius "RP"
     .InnerRadius "0"
     .Axis "z"
     .Zrange "-0.2", "0"
     .Xcenter "45"
     .Ycenter "45"
     .Segments "0"
     .Create
End With

'@ define cylinder: BanZi:up

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
With Cylinder
     .Reset
     .Name "up"
     .Component "BanZi"
     .Material "PEC"
     .OuterRadius "RP"
     .InnerRadius "0"
     .Axis "z"
     .Zrange "h", "h+0.2"
     .Xcenter "45"
     .Ycenter "45"
     .Segments "0"
     .Create
End With

'@ define cylinder: ZhuZi:zhu_yuan

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
With Cylinder
     .Reset
     .Name "zhu_yuan"
     .Component "ZhuZi"
     .Material "PEC"
     .OuterRadius "zhu_r"
     .InnerRadius "0"
     .Axis "z"
     .Zrange "0", "h"
     .Xcenter "45"
     .Ycenter "45"
     .Segments "0"
     .Create
End With

'@ transform: translate ZhuZi

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
With Transform
     .Reset
     .Name "ZhuZi"
     .Vector "r", "0", "0"
     .UsePickedPoints "False"
     .InvertPickedPoints "False"
     .MultipleObjects "False"
     .GroupObjects "False"
     .Repetitions "1"
     .MultipleSelection "False"
     .Transform "Shape", "Translate"
End With

'@ transform: rotate ZhuZi

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
With Transform
     .Reset
     .Name "ZhuZi"
     .Origin "Free"
     .Center "45", "45", "0"
     .Angle "0", "0", "360/k"
     .MultipleObjects "True"
     .GroupObjects "True"
     .Repetitions "k"
     .MultipleSelection "False"
     .Destination ""
     .Material ""
     .Transform "Shape", "Rotate"
End With

'@ boolean insert shapes: BanZi:JieZhiBan, ZhuZi:zhu_yuan

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
Solid.Insert "BanZi:JieZhiBan", "ZhuZi:zhu_yuan"

'@ define cylinder: KuiDian:TongZhou_out

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
With Cylinder
     .Reset
     .Name "TongZhou_out"
     .Component "KuiDian"
     .Material "PEC"
     .OuterRadius "0.5"
     .InnerRadius "0.4"
     .Axis "z"
     .Zrange "-1.5", "-0.2"
     .Xcenter "45+l"
     .Ycenter "45"
     .Segments "0"
     .Create
End With

'@ define cylinder: KuiDian:TongZhou_in

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
With Cylinder
     .Reset
     .Name "TongZhou_in"
     .Component "KuiDian"
     .Material "PEC"
     .OuterRadius "r_in"
     .InnerRadius "0"
     .Axis "z"
     .Zrange "-1.5", "hp"
     .Xcenter "45+l"
     .Ycenter "45"
     .Segments "0"
     .Create
End With

'@ define cylinder: KuiDian:solid1

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
With Cylinder
     .Reset
     .Name "solid1"
     .Component "KuiDian"
     .Material "Vacuum"
     .OuterRadius "0.4"
     .InnerRadius "0"
     .Axis "z"
     .Zrange "-0.2", "0"
     .Xcenter "45+l"
     .Ycenter "45"
     .Segments "0"
     .Create
End With

'@ transform: rotate KuiDian

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
With Transform
     .Reset
     .Name "KuiDian"
     .Origin "Free"
     .Center "45", "45", "0"
     .Angle "0", "0", "xita"
     .MultipleObjects "True"
     .GroupObjects "False"
     .Repetitions "1"
     .MultipleSelection "False"
     .Destination ""
     .Material ""
     .Transform "Shape", "Rotate"
End With

'@ boolean subtract shapes: BanZi:Ground, KuiDian:solid1

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
Solid.Subtract "BanZi:Ground", "KuiDian:solid1"

'@ boolean subtract shapes: BanZi:Ground, KuiDian:solid1_1

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
Solid.Subtract "BanZi:Ground", "KuiDian:solid1_1"

'@ boolean insert shapes: BanZi:JieZhiBan, KuiDian:TongZhou_in

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
With Solid
     .Version 10
     .Insert "BanZi:JieZhiBan", "KuiDian:TongZhou_in"
     .Version 1
End With

'@ boolean insert shapes: BanZi:JieZhiBan, KuiDian:TongZhou_in_1

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
With Solid
     .Version 10
     .Insert "BanZi:JieZhiBan", "KuiDian:TongZhou_in_1"
     .Version 1
End With

'@ pick edge

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
Pick.PickEdgeFromId "KuiDian:TongZhou_out", "1", "1"

'@ define port: 1

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
With Port
     .Reset
     .PortNumber "1"
     .Label ""
     .NumberOfModes "1"
     .AdjustPolarization "False"
     .PolarizationAngle "0.0"
     .ReferencePlaneDistance "0"
     .TextSize "50"
     .Coordinates "Picks"
     .Orientation "positive"
     .PortOnBound "False"
     .ClipPickedPortToBound "False"
     .Xrange "49.5", "50.5"
     .Yrange "44.5", "45.5"
     .Zrange "-1.5", "-1.5"
     .XrangeAdd "0.0", "0.0"
     .YrangeAdd "0.0", "0.0"
     .ZrangeAdd "0.0", "0.0"
     .SingleEnded "False"
     .Create
End With

'@ pick edge

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
Pick.PickEdgeFromId "KuiDian:TongZhou_out_1", "1", "1"

'@ define port: 2

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
With Port
     .Reset
     .PortNumber "2"
     .Label ""
     .NumberOfModes "1"
     .AdjustPolarization "False"
     .PolarizationAngle "0.0"
     .ReferencePlaneDistance "0"
     .TextSize "50"
     .Coordinates "Picks"
     .Orientation "positive"
     .PortOnBound "False"
     .ClipPickedPortToBound "False"
     .Xrange "44.5", "45.5"
     .Yrange "49.5", "50.5"
     .Zrange "-1.5", "-1.5"
     .XrangeAdd "0.0", "0.0"
     .YrangeAdd "0.0", "0.0"
     .ZrangeAdd "0.0", "0.0"
     .SingleEnded "False"
     .Create
End With

'@ define solver excitation modes

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
With Solver
     .ResetExcitationModes
     .SimultaneousExcitation "True"
     .SetSimultaneousExcitAutoLabel "True"
     .SetSimultaneousExcitationLabel "1[1.0,0.0]+2[1.0,90],[10]"
     .SetSimultaneousExcitationOffset "Phaseshift"
     .PhaseRefFrequency "10"
     .ExcitationPortMode "1", "1", "1.0", "0.0", "default", "True"
     .ExcitationPortMode "2", "1", "1.0", "90", "default", "True"
End With

'@ define time domain solver parameters

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
Mesh.SetCreator "High Frequency"
With Solver
     .Method "Hexahedral"
     .CalculationType "TD-S"
     .StimulationPort "All"
     .StimulationMode "All"
     .SteadyStateLimit "-30.0"
     .MeshAdaption "False"
     .AutoNormImpedance "False"
     .NormingImpedance "50"
     .CalculateModesOnly "False"
     .SParaSymmetry "False"
     .StoreTDResultsInCache "False"
     .FullDeembedding "False"
     .SuperimposePLWExcitation "False"
     .UseSensitivityAnalysis "False"
End With

'@ define solver excitation modes

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
With Solver
     .ResetExcitationModes
     .SimultaneousExcitation "True"
     .SetSimultaneousExcitAutoLabel "True"
     .SetSimultaneousExcitationLabel "1[1.0,0.0]+2[1.0,90],[10]"
     .SetSimultaneousExcitationOffset "Phaseshift"
     .PhaseRefFrequency "10"
     .ExcitationPortMode "1", "1", "1.0", "0.0", "default", "True"
     .ExcitationPortMode "2", "1", "1.0", "90", "default", "True"
End With

'@ define time domain solver parameters

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
Mesh.SetCreator "High Frequency"
With Solver
     .Method "Hexahedral"
     .CalculationType "TD-S"
     .StimulationPort "Selected"
     .StimulationMode "All"
     .SteadyStateLimit "-30.0"
     .MeshAdaption "False"
     .AutoNormImpedance "False"
     .NormingImpedance "50"
     .CalculateModesOnly "False"
     .SParaSymmetry "False"
     .StoreTDResultsInCache "False"
     .FullDeembedding "False"
     .SuperimposePLWExcitation "False"
     .UseSensitivityAnalysis "False"
End With

'@ define farfield monitor: farfield (f=f)

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
With Monitor
     .Delete "farfield (f=8)"
End With
With Monitor
     .Reset
     .Name "farfield (f=f)"
     .Domain "Frequency"
     .FieldType "Farfield"
     .Frequency "f"
     .UseSubvolume "False"
     .ExportFarfieldSource "False"
     .SetSubvolume "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
     .Create
End With

'@ define monitor: e-field (f=f)

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
With Monitor
     .Delete "e-field (f=8)"
End With
With Monitor
     .Reset
     .Name "e-field (f=f)"
     .Dimension "Volume"
     .Domain "Frequency"
     .FieldType "Efield"
     .Frequency "f"
     .UseSubvolume "False"
     .SetSubvolume "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
     .Create
End With

'@ define monitor: h-field (f=f)

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
With Monitor
     .Delete "h-field (f=8)"
End With
With Monitor
     .Reset
     .Name "h-field (f=f)"
     .Dimension "Volume"
     .Domain "Frequency"
     .FieldType "Hfield"
     .Frequency "f"
     .UseSubvolume "False"
     .SetSubvolume "0.0", "0.0", "0.0", "0.0", "0.0", "0.0"
     .Create
End With

'@ define monitor: power (f=f)

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
With Monitor
     .Delete "power (f=8)"
End With
With Monitor
     .Reset
     .Name "power (f=f)"
     .Dimension "Volume"
     .Domain "Frequency"
     .FieldType "Powerflow"
     .Frequency "f"
     .Create
End With

'@ define monitor: loss (f=f)

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
With Monitor
     .Delete "loss (f=8)"
End With
With Monitor
     .Reset
     .Name "loss (f=f)"
     .Dimension "Volume"
     .Domain "Frequency"
     .FieldType "Powerloss"
     .Frequency "f"
     .Create
End With

'@ set mesh properties (Hexahedral)

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
With Mesh
     .MeshType "PBA"
     .SetCreator "High Frequency"
End With
With MeshSettings
     .SetMeshType "Hex"
     .Set "Version", 1
     'MAX CELL - WAVELENGTH REFINEMENT
     .Set "StepsPerWaveNear", "20"
     .Set "StepsPerWaveFar", "20"
     .Set "WavelengthRefinementSameAsNear", "1"
     'MAX CELL - GEOMETRY REFINEMENT
     .Set "StepsPerBoxNear", "20"
     .Set "StepsPerBoxFar", "1"
     .Set "MaxStepNear", "0"
     .Set "MaxStepFar", "0"
     .Set "ModelBoxDescrNear", "maxedge"
     .Set "ModelBoxDescrFar", "maxedge"
     .Set "UseMaxStepAbsolute", "0"
     .Set "GeometryRefinementSameAsNear", "0"
     'MIN CELL
     .Set "UseRatioLimitGeometry", "1"
     .Set "RatioLimitGeometry", "20"
     .Set "MinStepGeometryX", "0"
     .Set "MinStepGeometryY", "0"
     .Set "MinStepGeometryZ", "0"
     .Set "UseSameMinStepGeometryXYZ", "1"
End With
With MeshSettings
     .SetMeshType "Hex"
     .Set "FaceRefinementOn", "0"
     .Set "FaceRefinementPolicy", "2"
     .Set "FaceRefinementRatio", "2"
     .Set "FaceRefinementStep", "0"
     .Set "FaceRefinementNSteps", "2"
     .Set "EllipseRefinementOn", "0"
     .Set "EllipseRefinementPolicy", "2"
     .Set "EllipseRefinementRatio", "2"
     .Set "EllipseRefinementStep", "0"
     .Set "EllipseRefinementNSteps", "2"
     .Set "FaceRefinementBufferLines", "3"
     .Set "EdgeRefinementOn", "1"
     .Set "EdgeRefinementPolicy", "1"
     .Set "EdgeRefinementRatio", "2"
     .Set "EdgeRefinementStep", "0"
     .Set "EdgeRefinementBufferLines", "3"
     .Set "RefineEdgeMaterialGlobal", "0"
     .Set "RefineAxialEdgeGlobal", "0"
     .Set "BufferLinesNear", "3"
     .Set "UseDielectrics", "1"
     .Set "EquilibrateOn", "0"
     .Set "Equilibrate", "1.5"
     .Set "IgnoreThinPanelMaterial", "0"
End With
With MeshSettings
     .SetMeshType "Hex"
     .Set "SnapToAxialEdges", "1"
     .Set "SnapToPlanes", "1"
     .Set "SnapToSpheres", "1"
     .Set "SnapToEllipses", "1"
     .Set "SnapToCylinders", "1"
     .Set "SnapToCylinderCenters", "1"
     .Set "SnapToEllipseCenters", "1"
End With
With Discretizer
     .MeshType "PBA"
     .PBAType "Fast PBA"
     .AutomaticPBAType "True"
     .FPBAAccuracyEnhancement "enable"
     .ConnectivityCheck "False"
     .ConvertGeometryDataAfterMeshing "True"
     .UsePecEdgeModel "True"
     .GapDetection "False"
     .FPBAGapTolerance "1e-3"
     .SetMaxParallelMesherThreads "Hex", "12"
     .SetParallelMesherMode "Hex", "None"
     .PointAccEnhancement "0"
     .UseSplitComponents "True"
     .EnableSubgridding "False"
     .PBAFillLimit "99"
     .AlwaysExcludePec "False"
End With

'@ farfield plot options

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
With FarfieldPlot
     .Plottype "Cartesian"
     .Vary "angle2"
     .Theta "30"
     .Phi "30"
     .Step "1"
     .Step2 "1"
     .SetLockSteps "True"
     .SetPlotRangeOnly "False"
     .SetThetaStart "0"
     .SetThetaEnd "180"
     .SetPhiStart "0"
     .SetPhiEnd "360"
     .SetTheta360 "False"
     .SymmetricRange "False"
     .SetTimeDomainFF "False"
     .SetFrequency "-1"
     .SetTime "0"
     .SetColorByValue "True"
     .DrawStepLines "False"
     .DrawIsoLongitudeLatitudeLines "False"
     .ShowStructure "False"
     .SetStructureTransparent "False"
     .SetFarfieldTransparent "False"
     .SetSpecials "enablepolarextralines"
     .SetPlotMode "Directivity"
     .Distance "1"
     .UseFarfieldApproximation "True"
     .SetScaleLinear "False"
     .SetLogRange "40"
     .SetLogNorm "0"
     .DBUnit "0"
     .EnableFixPlotMaximum "False"
     .SetFixPlotMaximumValue "1"
     .SetInverseAxialRatio "False"
     .SetAxesType "user"
     .SetAntennaType "unknown"
     .Phistart "1.000000e+000", "0.000000e+000", "0.000000e+000"
     .Thetastart "0.000000e+000", "0.000000e+000", "1.000000e+000"
     .PolarizationVector "0.000000e+000", "1.000000e+000", "0.000000e+000"
     .SetCoordinateSystemType "spherical"
     .SetAutomaticCoordinateSystem "True"
     .SetPolarizationType "Linear"
     .SlantAngle 0#
     .Origin "bbox"
     .Userorigin "0.000000e+000", "0.000000e+000", "0.000000e+000"
     .SetUserDecouplingPlane "False"
     .UseDecouplingPlane "False"
     .DecouplingPlaneAxis "X"
     .DecouplingPlanePosition "0.000000e+000"
     .LossyGround "False"
     .GroundEpsilon "1"
     .GroundKappa "0"
     .EnablePhaseCenterCalculation "False"
     .SetPhaseCenterAngularLimit "3.000000e+001"
     .SetPhaseCenterComponent "boresight"
     .SetPhaseCenterPlane "both"
     .ShowPhaseCenter "True"
     .StoreSettings
End With

'@ switch working plane

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
Plot.DrawWorkplane "false"

'@ switch bounding box

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
Plot.DrawBox "False"

'@ switch working plane

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
Plot.DrawWorkplane "true"

'@ farfield plot options

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
With FarfieldPlot
     .Plottype "Polar"
     .Vary "angle1"
     .Theta "240"
     .Phi "240"
     .Step "1"
     .Step2 "1"
     .SetLockSteps "True"
     .SetPlotRangeOnly "False"
     .SetThetaStart "0"
     .SetThetaEnd "180"
     .SetPhiStart "0"
     .SetPhiEnd "360"
     .SetTheta360 "False"
     .SymmetricRange "False"
     .SetTimeDomainFF "False"
     .SetFrequency "-1"
     .SetTime "0"
     .SetColorByValue "True"
     .DrawStepLines "False"
     .DrawIsoLongitudeLatitudeLines "False"
     .ShowStructure "False"
     .SetStructureTransparent "False"
     .SetFarfieldTransparent "False"
     .SetSpecials "enablepolarextralines"
     .SetPlotMode "Directivity"
     .Distance "1"
     .UseFarfieldApproximation "True"
     .SetScaleLinear "False"
     .SetLogRange "40"
     .SetLogNorm "0"
     .DBUnit "0"
     .EnableFixPlotMaximum "False"
     .SetFixPlotMaximumValue "1"
     .SetInverseAxialRatio "False"
     .SetAxesType "user"
     .SetAntennaType "unknown"
     .Phistart "1.000000e+000", "0.000000e+000", "0.000000e+000"
     .Thetastart "0.000000e+000", "0.000000e+000", "1.000000e+000"
     .PolarizationVector "0.000000e+000", "1.000000e+000", "0.000000e+000"
     .SetCoordinateSystemType "spherical"
     .SetAutomaticCoordinateSystem "True"
     .SetPolarizationType "Linear"
     .SlantAngle 0#
     .Origin "bbox"
     .Userorigin "0.000000e+000", "0.000000e+000", "0.000000e+000"
     .SetUserDecouplingPlane "False"
     .UseDecouplingPlane "False"
     .DecouplingPlaneAxis "X"
     .DecouplingPlanePosition "0.000000e+000"
     .LossyGround "False"
     .GroundEpsilon "1"
     .GroundKappa "0"
     .EnablePhaseCenterCalculation "False"
     .SetPhaseCenterAngularLimit "3.000000e+001"
     .SetPhaseCenterComponent "boresight"
     .SetPhaseCenterPlane "both"
     .ShowPhaseCenter "True"
     .StoreSettings
End With

'@ delete monitors

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
Monitor.Delete "farfield (f=10)"
Monitor.Delete "farfield (f=12)"

'@ farfield plot options

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
With FarfieldPlot
     .Plottype "Polar"
     .Vary "angle1"
     .Theta "180"
     .Phi "180"
     .Step "1"
     .Step2 "1"
     .SetLockSteps "True"
     .SetPlotRangeOnly "False"
     .SetThetaStart "0"
     .SetThetaEnd "180"
     .SetPhiStart "0"
     .SetPhiEnd "360"
     .SetTheta360 "False"
     .SymmetricRange "False"
     .SetTimeDomainFF "False"
     .SetFrequency "-1"
     .SetTime "0"
     .SetColorByValue "True"
     .DrawStepLines "False"
     .DrawIsoLongitudeLatitudeLines "False"
     .ShowStructure "False"
     .SetStructureTransparent "False"
     .SetFarfieldTransparent "False"
     .SetSpecials "enablepolarextralines"
     .SetPlotMode "Gain"
     .Distance "1"
     .UseFarfieldApproximation "True"
     .SetScaleLinear "False"
     .SetLogRange "40"
     .SetLogNorm "0"
     .DBUnit "0"
     .EnableFixPlotMaximum "False"
     .SetFixPlotMaximumValue "1"
     .SetInverseAxialRatio "False"
     .SetAxesType "user"
     .SetAntennaType "unknown"
     .Phistart "1.000000e+000", "0.000000e+000", "0.000000e+000"
     .Thetastart "0.000000e+000", "0.000000e+000", "1.000000e+000"
     .PolarizationVector "0.000000e+000", "1.000000e+000", "0.000000e+000"
     .SetCoordinateSystemType "spherical"
     .SetAutomaticCoordinateSystem "True"
     .SetPolarizationType "Linear"
     .SlantAngle 0#
     .Origin "bbox"
     .Userorigin "0.000000e+000", "0.000000e+000", "0.000000e+000"
     .SetUserDecouplingPlane "False"
     .UseDecouplingPlane "False"
     .DecouplingPlaneAxis "X"
     .DecouplingPlanePosition "0.000000e+000"
     .LossyGround "False"
     .GroundEpsilon "1"
     .GroundKappa "0"
     .EnablePhaseCenterCalculation "False"
     .SetPhaseCenterAngularLimit "3.000000e+001"
     .SetPhaseCenterComponent "boresight"
     .SetPhaseCenterPlane "both"
     .ShowPhaseCenter "True"
     .StoreSettings
End With

'@ define material: Rogers RT6035HTC (loss free)

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
With Material
     .Reset
     .Name "Rogers RT6035HTC (loss free)"
     .Folder ""
.FrqType "all"
.Type "Normal"
.SetMaterialUnit "GHz", "mm"
.Epsilon "3.5"
.Mue "1.0"
.Kappa "0.0"
.TanD "0.0"
.TanDFreq "0.0"
.TanDGiven "False"
.TanDModel "ConstTanD"
.KappaM "0.0"
.TanDM "0.0"
.TanDMFreq "0.0"
.TanDMGiven "False"
.TanDMModel "ConstKappa"
.DispModelEps "None"
.DispModelMue "None"
.DispersiveFittingSchemeEps "General 1st"
.DispersiveFittingSchemeMue "General 1st"
.UseGeneralDispersionEps "False"
.UseGeneralDispersionMue "False"
.Rho "0.0"
.ThermalType "Normal"
.ThermalConductivity "0.60"
.SetActiveMaterial "all"
.Colour "0.75", "0.95", "0.85"
.Wireframe "False"
.Transparency "0"
.Create
End With

'@ change material: BanZi:JieZhiBan to: Rogers RT6035HTC (loss free)

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
Solid.ChangeMaterial "BanZi:JieZhiBan", "Rogers RT6035HTC (loss free)"

'@ define cylinder: KuiDian:solid1

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
With Cylinder
     .Reset
     .Name "solid1"
     .Component "KuiDian"
     .Material "Vacuum"
     .OuterRadius "0.5"
     .InnerRadius "0"
     .Axis "z"
     .Zrange "-1", "0"
     .Xcenter "45"
     .Ycenter "45"
     .Segments "0"
     .Create
End With

'@ transform: translate KuiDian:solid1

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
With Transform
     .Reset
     .Name "KuiDian:solid1"
     .Vector "0", "-l", "0"
     .UsePickedPoints "False"
     .InvertPickedPoints "False"
     .MultipleObjects "False"
     .GroupObjects "False"
     .Repetitions "1"
     .MultipleSelection "False"
     .Transform "Shape", "Translate"
End With

'@ transform: rotate KuiDian:solid1

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
With Transform
     .Reset
     .Name "KuiDian:solid1"
     .Origin "Free"
     .Center "45", "45", "0"
     .Angle "0", "0", "-90"
     .MultipleObjects "True"
     .GroupObjects "False"
     .Repetitions "1"
     .MultipleSelection "False"
     .Destination ""
     .Material ""
     .Transform "Shape", "Rotate"
End With

'@ boolean subtract shapes: BanZi:Ground, KuiDian:solid1

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
Solid.Subtract "BanZi:Ground", "KuiDian:solid1"

'@ boolean subtract shapes: BanZi:Ground, KuiDian:solid1_1

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
Solid.Subtract "BanZi:Ground", "KuiDian:solid1_1"

'@ transform: rotate KuiDian

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
With Transform
     .Reset
     .Name "KuiDian"
     .Origin "Free"
     .Center "45", "45", "0"
     .Angle "0", "0", "180"
     .MultipleObjects "True"
     .GroupObjects "False"
     .Repetitions "1"
     .MultipleSelection "False"
     .Destination ""
     .Material ""
     .Transform "Shape", "Rotate"
End With

'@ pick edge

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
Pick.PickEdgeFromId "KuiDian:TongZhou_out_2", "1", "1"

'@ define port: 3

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
With Port
     .Reset
     .PortNumber "3"
     .Label ""
     .NumberOfModes "1"
     .AdjustPolarization "False"
     .PolarizationAngle "0.0"
     .ReferencePlaneDistance "0"
     .TextSize "50"
     .Coordinates "Picks"
     .Orientation "positive"
     .PortOnBound "False"
     .ClipPickedPortToBound "False"
     .Xrange "34", "35"
     .Yrange "44.5", "45.5"
     .Zrange "-1.5", "-1.5"
     .XrangeAdd "0.0", "0.0"
     .YrangeAdd "0.0", "0.0"
     .ZrangeAdd "0.0", "0.0"
     .SingleEnded "False"
     .Create
End With

'@ pick edge

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
Pick.PickEdgeFromId "KuiDian:TongZhou_out_1_1", "1", "1"

'@ define port: 4

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
With Port
     .Reset
     .PortNumber "4"
     .Label ""
     .NumberOfModes "1"
     .AdjustPolarization "False"
     .PolarizationAngle "0.0"
     .ReferencePlaneDistance "0"
     .TextSize "50"
     .Coordinates "Picks"
     .Orientation "positive"
     .PortOnBound "False"
     .ClipPickedPortToBound "False"
     .Xrange "44.5", "45.5"
     .Yrange "34", "35"
     .Zrange "-1.5", "-1.5"
     .XrangeAdd "0.0", "0.0"
     .YrangeAdd "0.0", "0.0"
     .ZrangeAdd "0.0", "0.0"
     .SingleEnded "False"
     .Create
End With

'@ define solver excitation modes

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
With Solver
     .ResetExcitationModes
     .SimultaneousExcitation "True"
     .SetSimultaneousExcitAutoLabel "True"
     .SetSimultaneousExcitationLabel "1[1.0,0.0]+2[1.0,90]+3[1.0,180]+4[1.0,270],[10]"
     .SetSimultaneousExcitationOffset "Phaseshift"
     .PhaseRefFrequency "10"
     .ExcitationPortMode "1", "1", "1.0", "0.0", "default", "True"
     .ExcitationPortMode "2", "1", "1.0", "90", "default", "True"
     .ExcitationPortMode "3", "1", "1.0", "180", "default", "True"
     .ExcitationPortMode "4", "1", "1.0", "270", "default", "True"
End With

'@ farfield plot options

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
With FarfieldPlot
     .Plottype "3D"
     .Vary "angle1"
     .Theta "180"
     .Phi "180"
     .Step "5"
     .Step2 "5"
     .SetLockSteps "True"
     .SetPlotRangeOnly "False"
     .SetThetaStart "0"
     .SetThetaEnd "180"
     .SetPhiStart "0"
     .SetPhiEnd "360"
     .SetTheta360 "False"
     .SymmetricRange "False"
     .SetTimeDomainFF "False"
     .SetFrequency "-1"
     .SetTime "0"
     .SetColorByValue "True"
     .DrawStepLines "False"
     .DrawIsoLongitudeLatitudeLines "False"
     .ShowStructure "False"
     .SetStructureTransparent "False"
     .SetFarfieldTransparent "False"
     .SetSpecials "enablepolarextralines"
     .SetPlotMode "Gain"
     .Distance "1"
     .UseFarfieldApproximation "True"
     .SetScaleLinear "False"
     .SetLogRange "40"
     .SetLogNorm "0"
     .DBUnit "0"
     .EnableFixPlotMaximum "False"
     .SetFixPlotMaximumValue "1"
     .SetInverseAxialRatio "False"
     .SetAxesType "user"
     .SetAntennaType "unknown"
     .Phistart "1.000000e+000", "0.000000e+000", "0.000000e+000"
     .Thetastart "0.000000e+000", "0.000000e+000", "1.000000e+000"
     .PolarizationVector "0.000000e+000", "1.000000e+000", "0.000000e+000"
     .SetCoordinateSystemType "spherical"
     .SetAutomaticCoordinateSystem "True"
     .SetPolarizationType "Linear"
     .SlantAngle 0#
     .Origin "bbox"
     .Userorigin "0.000000e+000", "0.000000e+000", "0.000000e+000"
     .SetUserDecouplingPlane "False"
     .UseDecouplingPlane "False"
     .DecouplingPlaneAxis "X"
     .DecouplingPlanePosition "0.000000e+000"
     .LossyGround "False"
     .GroundEpsilon "1"
     .GroundKappa "0"
     .EnablePhaseCenterCalculation "False"
     .SetPhaseCenterAngularLimit "3.000000e+001"
     .SetPhaseCenterComponent "boresight"
     .SetPhaseCenterPlane "both"
     .ShowPhaseCenter "True"
     .StoreSettings
End With

'@ set parametersweep options

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
With ParameterSweep
    .SetSimulationType "Transient"
End With

'@ add parsweep sequence: Sequence 1

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
With ParameterSweep
     .AddSequence "Sequence 1"
End With

'@ add parsweep parameter: Sequence 1:a

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
With ParameterSweep
     .AddParameter_Stepwidth "Sequence 1", "a", "2.5", "4.5", "0.5"
End With

'@ change material: BanZi:JieZhiBan to: Rogers RT5880 (lossy)

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
Solid.ChangeMaterial "BanZi:JieZhiBan", "Rogers RT5880 (lossy)"

'@ farfield plot options

'[VERSION]2015.0|24.0.2|20150116[/VERSION]
With FarfieldPlot
     .Plottype "3D"
     .Vary "angle2"
     .Theta "0"
     .Phi "0"
     .Step "5"
     .Step2 "5"
     .SetLockSteps "True"
     .SetPlotRangeOnly "False"
     .SetThetaStart "0"
     .SetThetaEnd "180"
     .SetPhiStart "0"
     .SetPhiEnd "360"
     .SetTheta360 "False"
     .SymmetricRange "False"
     .SetTimeDomainFF "False"
     .SetFrequency "-1"
     .SetTime "0"
     .SetColorByValue "True"
     .DrawStepLines "False"
     .DrawIsoLongitudeLatitudeLines "False"
     .ShowStructure "False"
     .SetStructureTransparent "False"
     .SetFarfieldTransparent "False"
     .SetSpecials "enablepolarextralines"
     .SetPlotMode "Gain"
     .Distance "1"
     .UseFarfieldApproximation "True"
     .SetScaleLinear "False"
     .SetLogRange "40"
     .SetLogNorm "0"
     .DBUnit "0"
     .EnableFixPlotMaximum "False"
     .SetFixPlotMaximumValue "1"
     .SetInverseAxialRatio "False"
     .SetAxesType "user"
     .SetAntennaType "unknown"
     .Phistart "1.000000e+000", "0.000000e+000", "0.000000e+000"
     .Thetastart "0.000000e+000", "0.000000e+000", "1.000000e+000"
     .PolarizationVector "0.000000e+000", "1.000000e+000", "0.000000e+000"
     .SetCoordinateSystemType "spherical"
     .SetAutomaticCoordinateSystem "True"
     .SetPolarizationType "Linear"
     .SlantAngle 0#
     .Origin "bbox"
     .Userorigin "0.000000e+000", "0.000000e+000", "0.000000e+000"
     .SetUserDecouplingPlane "False"
     .UseDecouplingPlane "False"
     .DecouplingPlaneAxis "X"
     .DecouplingPlanePosition "0.000000e+000"
     .LossyGround "False"
     .GroundEpsilon "1"
     .GroundKappa "0"
     .EnablePhaseCenterCalculation "False"
     .SetPhaseCenterAngularLimit "3.000000e+001"
     .SetPhaseCenterComponent "boresight"
     .SetPhaseCenterPlane "both"
     .ShowPhaseCenter "True"
     .StoreSettings
End With
