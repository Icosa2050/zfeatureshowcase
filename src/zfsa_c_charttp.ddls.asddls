@EndUserText.label: 'Chart TP'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true

define view entity ZFSA_C_CHARTTP
  as projection on ZFSA_R_ChartTP
{
  key ID,
      ParentID,
      CriticalityCode,
      IntegerValueForAreaChart,
      IntegerValueForOtherCharts,
      MinAmount,
      MaxAmount,
      AvgAmount,
      Uom,
      IntegerValueForLineChart,
      ForecastValue,
      TargetValue,
      Dimensions,
      AreachartTolUpperboundValue,
      AreachartTolLowerboundValue,
      AreachartDevUpperboundValue,
      AreachartDevLowerboundValue,
      /* Associations */
      _Criticality,
      _Root : redirected to parent ZFSA_C_RootTP,
      _UoM
}
